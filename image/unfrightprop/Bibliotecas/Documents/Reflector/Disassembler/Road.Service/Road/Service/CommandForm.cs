namespace Road.Service
{
    using Game.Service.actions;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Drawing;
    using System.Linq;
    using System.Windows.Forms;

    public class CommandForm : Form
    {
        private TextBox CommandStringTextBox;
        private IContainer components = null;
        private Button SendCommandButton;

        public CommandForm()
        {
            this.InitializeComponent();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.CommandStringTextBox = new TextBox();
            this.SendCommandButton = new Button();
            base.SuspendLayout();
            this.CommandStringTextBox.BackColor = Color.FromArgb(0x40, 0x40, 0x40);
            this.CommandStringTextBox.BorderStyle = BorderStyle.FixedSingle;
            this.CommandStringTextBox.Dock = DockStyle.Top;
            this.CommandStringTextBox.ForeColor = Color.Lime;
            this.CommandStringTextBox.Location = new Point(0, 0);
            this.CommandStringTextBox.Multiline = true;
            this.CommandStringTextBox.Name = "CommandStringTextBox";
            this.CommandStringTextBox.Size = new Size(0x2f0, 0x102);
            this.CommandStringTextBox.TabIndex = 0;
            this.SendCommandButton.Dock = DockStyle.Fill;
            this.SendCommandButton.FlatStyle = FlatStyle.Flat;
            this.SendCommandButton.ForeColor = Color.Gray;
            this.SendCommandButton.Location = new Point(0, 0x102);
            this.SendCommandButton.Name = "SendCommandButton";
            this.SendCommandButton.Size = new Size(0x2f0, 0x24);
            this.SendCommandButton.TabIndex = 1;
            this.SendCommandButton.Text = "Send";
            this.SendCommandButton.UseVisualStyleBackColor = true;
            this.SendCommandButton.Click += new EventHandler(this.SendCommandButton_Click);
            base.AutoScaleDimensions = new SizeF(6f, 13f);
            base.AutoScaleMode = AutoScaleMode.Font;
            this.BackColor = Color.Black;
            base.ClientSize = new Size(0x2f0, 0x126);
            base.ControlBox = false;
            base.Controls.Add(this.SendCommandButton);
            base.Controls.Add(this.CommandStringTextBox);
            base.FormBorderStyle = FormBorderStyle.FixedToolWindow;
            base.Name = "CommandForm";
            this.Text = "Command window";
            base.ResumeLayout(false);
            base.PerformLayout();
        }

        private void SendCommandButton_Click(object sender, EventArgs e)
        {
            if (this.CommandStringTextBox.Text != string.Empty)
            {
                string[] source = this.CommandStringTextBox.Text.Split(new char[] { ' ' });
                string commandName = source[0];
                List<string> list = source.ToList<string>();
                list.RemoveAt(0);
                ConsoleStart.DoCommand(commandName, list.ToArray());
            }
        }
    }
}

