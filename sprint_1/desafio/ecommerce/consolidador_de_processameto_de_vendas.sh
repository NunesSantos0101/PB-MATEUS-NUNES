backup_dir="/mnt/c/PB-MATEUS-NUNES/sprint_1/desafio/ecommerce/vendas/backup"
relatorio_final="$backup_dir/relatorio_final.txt"

> "$relatorio_final"
for relatorio in "$backup_dir"/relatorio_*.txt; do
    cat "$relatorio" >> "$relatorio_final"
    echo "" >> "$relatorio_final" 
done
