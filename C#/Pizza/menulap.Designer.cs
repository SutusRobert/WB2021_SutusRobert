using System.Windows.Forms;

namespace szamonkeres20260317
{
    partial class menulap
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnexit = new System.Windows.Forms.Button();
            this.btnszamol = new System.Windows.Forms.Button();
            this.btntorol = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txbfizetendo = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panelMenu = new System.Windows.Forms.Panel();
            this.SuspendLayout();
            // 
            // btnexit
            // 
            this.btnexit.Location = new System.Drawing.Point(694, 415);
            this.btnexit.Name = "btnexit";
            this.btnexit.Size = new System.Drawing.Size(75, 23);
            this.btnexit.TabIndex = 0;
            this.btnexit.Text = "Bezár";
            this.btnexit.UseVisualStyleBackColor = true;
            this.btnexit.Click += new System.EventHandler(this.btnexit_Click);
            // 
            // btnszamol
            // 
            this.btnszamol.Location = new System.Drawing.Point(12, 377);
            this.btnszamol.Name = "btnszamol";
            this.btnszamol.Size = new System.Drawing.Size(75, 23);
            this.btnszamol.TabIndex = 1;
            this.btnszamol.Text = "számol";
            this.btnszamol.UseVisualStyleBackColor = true;
            this.btnszamol.Click += new System.EventHandler(this.btnszamol_Click);
            // 
            // btntorol
            // 
            this.btntorol.Location = new System.Drawing.Point(12, 406);
            this.btntorol.Name = "btntorol";
            this.btntorol.Size = new System.Drawing.Size(75, 23);
            this.btntorol.TabIndex = 2;
            this.btntorol.Text = "töröl";
            this.btntorol.UseVisualStyleBackColor = true;
            this.btntorol.Click += new System.EventHandler(this.btntorol_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(276, 368);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(56, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Fizetendő:";
            // 
            // txbfizetendo
            // 
            this.txbfizetendo.Enabled = false;
            this.txbfizetendo.Location = new System.Drawing.Point(338, 365);
            this.txbfizetendo.Name = "txbfizetendo";
            this.txbfizetendo.Size = new System.Drawing.Size(100, 20);
            this.txbfizetendo.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(376, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(101, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "MENÜVÁLASZTÉK";
            // 
            // panelMenu
            // 
            this.panelMenu.AutoScroll = true;
            this.panelMenu.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.panelMenu.Location = new System.Drawing.Point(28, 37);
            this.panelMenu.Name = "panelMenu";
            this.panelMenu.Size = new System.Drawing.Size(750, 322);
            this.panelMenu.TabIndex = 7;
            // 
            // menulap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Tan;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.panelMenu);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txbfizetendo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btntorol);
            this.Controls.Add(this.btnszamol);
            this.Controls.Add(this.btnexit);
            this.Name = "menulap";
            this.Text = "menulap";
            this.Load += new System.EventHandler(this.menulap_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnexit;
        private System.Windows.Forms.Button btnszamol;
        private System.Windows.Forms.Button btntorol;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txbfizetendo;
        private System.Windows.Forms.Label label2;

        private Panel panelMenu;
    }
}