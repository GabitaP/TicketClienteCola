<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="SisProcesamientoColas.Inicio" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>REGISTRO CLIENTE</title>
    </head>
    <body>
        <form id="form1" runat="server">
        <%--Titulo general--%>
        <h2 class="text-overflow m-0">PROCESAMIENTO DE COLAS</h2>
        <%--Registro nueva atención--%>
        <fieldset  style="width: 700px" >
            <legend>REGISTRO</legend>
            <br />    
            <div> 
                <label for="idCliente">ID CLIENTE:  </label>
                <asp:TextBox name="txtIdCliente" value="" runat="server" id="IdCliente" required="required"/> &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfv_idCli" ControlToValidate="IdCliente" EnableClientScript="true" Display="Dynamic" SetFocusOnError="true" Text="Valor obligatorio" Enabled="true" runat="server"  ForeColor="Red"></asp:RequiredFieldValidator>

                <label for="NomCliente">NOMBRE CLIENTE:</label>
                <asp:TextBox name="txtNomCliente" onkeypress="return isAlphabetKey(event)"  runat="server" id="NomCliente" required="required"  /> &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="rfv_nomCli" ControlToValidate="NomCliente" EnableClientScript="true" Display="Dynamic" SetFocusOnError="true" Text="Valor obligatorio" Enabled="true" runat="server"  ForeColor="Red" ></asp:RequiredFieldValidator>
                
                <button type="button" id="NewProces" style="width: 100px; height: 35px;" onclientclick="return false" onserverclick="NewProces_Click" runat="server">GUARDAR</button>
            </div>
            <br />
        </fieldset>
        <br />
        <%--Estado de colas--%>
        <fieldset  style="width: 700px" >
            <br />      
            <table> 
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <td> 
                    <fieldset  style="width:300px" >
                        <legend>COLA 1</legend>
                        <br />
                        <%--Timer cola 1--%>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblTimerAviso" runat="server" Text="PROXIMO CLIENTE EN : "></asp:Label>
                                <asp:Label ID="lblTimerTime1" runat="server">10</asp:Label>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick"></asp:Timer>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div>
                        <br />
                        <%--Gridview cola 1--%>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" CssClass="table dt-responsive nowrap w-100" ID="grv_Cola1" AutoGenerateColumns="false" ClientIDMode="Static" EmptyDataText="No tienes parametros cargados" GridLines="None" autopostback="true">
                                    <Columns>
                                        <asp:BoundField DataField="PROC_ID" HeaderText="Código " ItemStyle-CssClass="hidden-phone " />
                                        <asp:BoundField DataField="PROC_ID_CLIENT" HeaderText="Cliente" ItemStyle-CssClass="hidden-phone " />                                   
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        </div>
                        <br />
                    </fieldset>
                </td> 
                <td>
                    <fieldset  style="width:300px" >
                        <legend>COLA2</legend>
                        <%--Timer cola 2--%>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblTimerAviso2" runat="server" Text="PROXIMO CLIENTE EN : "></asp:Label>
                                <asp:Label ID="lblTimerTime2" runat="server">18</asp:Label>
                                <asp:Timer ID="Timer2" runat="server" Interval="1000">
                                </asp:Timer>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div>
                        <br />
                        <%--Gridview cola 2--%>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" CssClass="table dt-responsive nowrap w-100" ID="grv_Cola2" AutoGenerateColumns="false" ClientIDMode="Static" EmptyDataText="No tienes parametros cargados" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="PROC_ID" HeaderText="Código " ItemStyle-CssClass="hidden-phone " />
                                        <asp:BoundField DataField="PROC_ID_CLIENT" HeaderText="Cliente" ItemStyle-CssClass="hidden-phone " />                                   
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        </div>
                        <br />
                    </fieldset> 
                </td>
            </table>
        </fieldset>
        </form>
    </body>
     <%--Validación del txtNomCliente para que solo ingrese letras  --%>
    <script language="Javascript" type="text/javascript">
        function isAlphabetKey(evt)
        {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if ((charCode <= 93 && charCode >= 65) || (charCode <= 122 && charCode >= 97))
            {
                return true;
            }
            alert("Por favor ingresar solo letras A-Z or a-z");
            return false;
        }
    </script>
</html>
