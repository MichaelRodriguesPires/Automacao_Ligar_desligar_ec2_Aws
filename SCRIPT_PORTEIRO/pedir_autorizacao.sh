INSTANCE_ID_PORTEIRO=  #adicionar o id da instancia 

#criar usuário IAM na AWS Selecionar as permissões, Criar as Polyces  Services(EC2); Describe(DescribeInstances); Dar o nome par a polyce;

IP_PORTEIRO=$(aws ec2 describe-instance --intance-ids $INSTANCE_ID_PORTEIRO --query "RESERVATION[].Intances[].PublicIpAddres) --profile cliente-porteiro --region us-east-1 --output json | grep -vE '\[|\]' | awK -F'"' '{print $2}')
echo $IP_PORTEIRO 

 #Local onde se encontra sua chave pem;

PEM_PATH="/home/michaeldevops/pasta de destino.pem"

Servidor_RDS_1= Nome do endereço do servidor de banco de dados para fechamento do tunel (endpoint)
PORTA_LOCAL_RED_1=3307

SERVIDOR_RDS_2=SERVIDOR 2
PORTA_LOCAL_RDS_2=5433 #porta de acesso Banco

 #comando para fechamento do tunel ssh

ssh -f -N -i $PEM_PATH ec2-user@IP_PORTEIRO -L $PORTA_LOCAL_RDS_1:3306 -L $PORTA_LOCAL_RDS_2:$SERVIDOR_RDS_2:5432

echo "Porteiro liberou acesso para:"
echo "> $SERVIDOR_RDS_1 no endereço *127.0.0.1:$PORTA_LOCAL_RDS_1"
echo "> $SERVIDOR_RDS_2 no endereço *127.0.0.1:$PORTA_LOCAL_RDS_2"