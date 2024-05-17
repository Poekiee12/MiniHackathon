# MiniHackathon

1. Draai de BICEP template in je eigen omgeving. Koppel de VNET’s nog niet aan VWAN.
2. Bekijk de NIC van de VM, welke effective routes zie je daarin terugkomen?
3. Koppel de VNET’s aan de VWAN. Speel met de routing configuration en controleer daarbij welke routes je op de VM ziet terugkomen. 
4. Wat is het verschil tussen route association en route propogation?
5. Kijk of de VM’s elkaar kunnen benaderen.
6. Koppel nu een Azure Firewall Basic in je HUB. Stel in de security configuration in dat de vnet’s beveiligd moeten worden met Azure Firewall. Welke routes zie je nu terugkomen in je VM’s?
7. Haal de security configuration weg in de Azure Firewall weg. Schakel Routing intent i.c.m. met de Azure Firewall in op de HUB. Zie je nu iets veranderen in de routing?
8. Wat is routing intent en hoe werkt dit precies?

Mocht je meer willen testen:

Ik ga er van uit dat je Routing intent hebt laten staan.

9. Maak een VNET03 aan. Rol hier een VM03 in uit.
10. Koppel hier een Virtual Network Gateway aan.
11. Verbind deze Virtual Network Gateway met de VWAN op basis van BGP.
12. Welke routes krijg je binnen van de VWAN op de VNET Gateway?
13. Welke routes krijg je binnen op de VNET GW als je routing intent uitschakelt op de VWAN?

![image](/Overview.png)