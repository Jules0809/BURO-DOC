# Variables
MD_FILE = Documentation_BURO.md
PDF_FILE = Documentation_BURO.pdf
TEMPLATE = template.tex

# Commandes
PDF_ENGINE = xelatex

# Règle par défaut
all: $(PDF_FILE)

# Règle pour générer le PDF
$(PDF_FILE): $(MD_FILE) $(TEMPLATE)
	@echo "Génération du fichier PDF..."
	pandoc $(MD_FILE) -o $(PDF_FILE) --pdf-engine=$(PDF_ENGINE) --template=$(TEMPLATE)
	@echo "PDF généré: $(PDF_FILE)"

# Règle pour forcer la génération
force:
	@echo "Forçage de la génération du PDF..."
	rm -f $(PDF_FILE)  # Supprime le PDF existant
	make  # Appelle la règle par défaut pour le régénérer

# Nettoyage des fichiers générés
clean:
	rm -f $(PDF_FILE)

# Règle pour afficher l'aide
help:
	@echo "Utilisation :"
	@echo "  make        - Générer le PDF."
	@echo "  make force  - Forcer la génération du PDF."
	@echo "  make clean  - Supprimer les fichiers générés."
	@echo "  make help   - Afficher cette aide."
