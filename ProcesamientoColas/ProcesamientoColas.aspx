<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcesamientoColas.aspx.cs" Inherits="ProcesamientoColas.ProcesamientoColas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>REGISTRO CLIENTE</title>
    </head>
    <body>
       <form id="form1" runat="server">
        <h2 class="text-overflow m-0">PROCESAMIENTO DE COLAS</h2>
        <fieldset  style="width: 700px" >
          <legend>REGISTRO</legend>
            <br />
              <div>
                <label for="idCliente">ID CLIENTE:  </label>
                <input type="text" name="txtIdCliente" value="" /> &nbsp;&nbsp;
              
                <label for="NomCliente">NOMBRE CLIENTE:</label>
                <input type="text" name="txtNomCliente" value="" /> &nbsp;&nbsp;

                <input type="submit" value="Submit" class="submit" />
              </div>
            <br />
        </fieldset>
        <br />
        <fieldset  style="width: 700px" >
            <br />      
            <table> 
                <td> 
                    <fieldset  style="width:300px" >
                    <legend>COLA1</legend>
                    <br />
                      <div>
                        <asp:GridView ID="grv_Cola1" runat="server" AutoGenerateColumns="true" CSSSelectorClass="grid"></asp:GridView>
                      </div>
                    <br />
                    </fieldset>
                </td> 
                <td> 
                    <fieldset  style="width:300px" >
                    <legend>COLA1</legend>
                    <br />
                      <div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" CSSSelectorClass="grid"></asp:GridView>
                      </div>
                    <br />
                    </fieldset> 
                </td>
            </table>
        </fieldset>
      </form>
    </body>
</html>
