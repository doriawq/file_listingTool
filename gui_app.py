#!/usr/bin/env python3
import os
import shutil
import subprocess
import sys
from pathlib import Path
import tkinter as tk
from tkinter import messagebox

BASE_DIR = Path("/Users/Doria/Desktop/AI_projects/file_listingTool")
TARGETS_DIR = BASE_DIR / "targets"
BIN = BASE_DIR / "dist" / "file_listing"
SCRIPT = BASE_DIR / "generate_catalog.py"
name_var = None


def ensure_targets():
    TARGETS_DIR.mkdir(parents=True, exist_ok=True)


def clear_targets():
    if not TARGETS_DIR.exists():
        ensure_targets()
        messagebox.showinfo("Clear", "targets folder was missing and has been created.")
        return

    if not messagebox.askyesno(
        "Confirm Clear",
        "This will permanently delete ALL files and folders inside targets. Continue?",
    ):
        return

    for item in TARGETS_DIR.iterdir():
        # Remove everything inside targets, but keep output folder
        if item.name == "output":
            continue
        if item.is_dir():
            shutil.rmtree(item)
        else:
            item.unlink()

    messagebox.showinfo("Clear", "targets folder has been cleared.")


def generate_catalog():
    ensure_targets()

    name = name_var.get().strip() if name_var else ""
    out_xlsx = None
    out_docx = None
    if name:
        # Strip known extensions if user typed them
        if name.lower().endswith(".xlsx"):
            name = name[:-5]
        if name.lower().endswith(".docx"):
            name = name[:-5]
        if name:
            out_xlsx = str(TARGETS_DIR / "output" / "spreadsheet" / f"{name}.xlsx")
            out_docx = str(TARGETS_DIR / "output" / "doc" / f"{name}.docx")

    if BIN.exists() and os.access(BIN, os.X_OK):
        cmd = [str(BIN)]
    else:
        cmd = [sys.executable, str(SCRIPT)]

    if out_xlsx and out_docx:
        cmd.extend(["--out-xlsx", out_xlsx, "--out-docx", out_docx])
    if name:
        cmd.extend(["--title", name])

    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        messagebox.showinfo("Done", result.stdout.strip() or "Catalog generated.")
    except subprocess.CalledProcessError as exc:
        output = (exc.stdout or "") + "\n" + (exc.stderr or "")
        messagebox.showerror("Error", output.strip() or "Failed to generate catalog.")


def main():
    ensure_targets()

    root = tk.Tk()
    root.title("文件目录文件生成器")
    root.geometry("420x230")
    root.resizable(False, False)

    # Blue/white theme
    bg = "#EAF2FF"
    btn_fg = "#2F6FEB"
    root.configure(bg=bg)

    tk.Label(root, text="", bg=bg).pack(pady=6)

    global name_var
    name_frame = tk.Frame(root, bg=bg)
    name_frame.pack(pady=6)
    tk.Label(name_frame, text="目录名称", bg=bg, fg="#2C3E50").pack(side="left", padx=6)
    name_var = tk.StringVar()
    name_entry = tk.Entry(name_frame, textvariable=name_var, width=24)
    name_entry.pack(side="left", padx=4)

    btn_clear = tk.Button(
        root,
        text="Clear targets folder",
        width=28,
        command=clear_targets,
        fg=btn_fg,
        activeforeground="#1F5BD6",
        relief="groove",
    )
    btn_clear.pack(pady=6)

    btn_generate = tk.Button(
        root,
        text="Generate catalog",
        width=28,
        command=generate_catalog,
        fg=btn_fg,
        activeforeground="#1F5BD6",
        relief="groove",
    )
    btn_generate.pack(pady=6)

    footer = tk.Label(
        root,
        text="开发者：Doria Wang",
        bg=bg,
        fg="#2C3E50",
    )
    footer.pack(side="bottom", pady=8)

    root.mainloop()


if __name__ == "__main__":
    main()
