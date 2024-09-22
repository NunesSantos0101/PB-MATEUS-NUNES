base_dir="/mnt/c/PB-MATEUS-NUNES/sprint_1/desafio/ecommerce"
vendas_dir="$base_dir/vendas"
backup_subdir="$vendas_dir/backup"
source_file="$base_dir/dados_de_vendas.csv"
backup_file="$backup_subdir/backup-dados-$(date +"%Y%m%d").csv"
relatorio_file="$backup_subdir/relatorio_$(date +"%Y%m%d_%H:%M").txt"
zip_file="$backup_subdir/backup-dados-$(date +"%Y%m%d").zip"

mkdir -p "$vendas_dir"

cp "$source_file" "$vendas_dir/"

mkdir -p "$backup_subdir"

cp "$vendas_dir/dados_de_vendas.csv" "$backup_file"

{
    echo "Data: $(date +"%Y/%m/%d %H:%M")"
    echo -n "Data da 1° venda: "
    awk -F, 'NR>1 {print $5}' "$backup_file" | head -n 1
    
    echo -n "Data do última venda: "
    tail -n 2 "$backup_file" | head -n 1 | awk -F, '{print $5}'
    
    echo -n "Quantidade total de itens diferentes vendidos: "
    awk -F, 'NR>1 {sum += $3} END {print sum}' "$backup_file"
    
    awk 'NR > 1 {print $0}' "$backup_file" | head -n 10
} > "$relatorio_file"

cd "$backup_subdir"
zip "$zip_file" "$(basename "$backup_file")" "$(basename "$relatorio_file")"

rm "$backup_file"

rm "$vendas_dir/dados_de_vendas.csv"
