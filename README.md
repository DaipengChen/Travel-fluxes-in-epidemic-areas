######The manual of calculating travel fluxes ######

"Determining travel fluxes in epidemic areas" by Daipeng Chen, Yuyi Xue, Yanni Xiao (2021)

The matlab code is edited under MATLAB 2021a.

$"Data" document:
              It includes four datasets.
              1.The New_cases is daily reported COVID-19 cases in all citites. 
              2.The Population_flow is the estimated mobility network among the cities. We recommend
                 replacing it with real data if available.
              3.The Growth_rate is the estimated parameters in fomular (6) which gives the value of growth rate.
              4.The Diffusion_distance is the calculation result of the code in "Diffusion_distance" document.

$"Diffusion_distance" document:
              There is only one code used to calculate the diffusion distance among cities.

$"Time_location" document:
              There is one main function to solve the zero-one programming (9). Other function files are used
              to generate the growth rate and COVID-19 cases.

$"Travel_flux" document:
              The files in this document are mainly used to calculate the potential in each city and the travel flux 
              among these cities.

$"Testable_prediction" document:
              The files in this document are used to perform the prediction under different movement pattern. 

@Remark: After downloading the code, please modify the input file path (C:\Users\Daipeng1993\Desktop\Code\Data\) to your own storage path. Some function in different documents are common.
