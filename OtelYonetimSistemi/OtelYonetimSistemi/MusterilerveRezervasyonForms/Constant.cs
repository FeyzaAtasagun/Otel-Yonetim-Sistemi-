using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtelYonetimSistemi.MusterilerveRezervasyonForms
{
    internal class Constant
    {
        public static List<Button> GetRoomButtons()
        {
            List<Button> buttons = new List<Button>();

            int x = 20;
            int y = 20;
            int buttonWidth = 80;
            int buttonHeight = 50;
            int padding = 10;
            int columns = 4;

            for (int i = 1; i <= 16; i++)
            {
                Button btn = new Button();
                btn.Name = $"btnOda{i}";
                btn.Text = $"Oda {i}";
                btn.Size = new Size(buttonWidth, buttonHeight);

                int col = (i - 1) % columns;
                int row = (i - 1) / columns;

                btn.Location = new Point(x + col * (buttonWidth + padding), y + row * (buttonHeight + padding));

                buttons.Add(btn);
            }

            return buttons;
        }
    }
 }
