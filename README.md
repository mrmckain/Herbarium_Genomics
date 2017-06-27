# Herbarium Genomics
Repository for various scripts and databases used for herbarium genomics.

<h1>Fungal Database</h1>

The Fungal Database includes both nuclear genomes (312) and mitochondrial genomes (79) from multiple species found in the <a href="http://genome.jgi.doe.gov/programs/fungi/index.jsf">JGI MycoCosm</a> database. Species were originally chosen to include a single representative from each genus, but species identification has changed so this is no longer the case. Future version of this collection will target species that are commonly identified as contaminants in herbarium specimens. 

In order to recreate the database used in Saeidi et al. (In Review), use the following commands with the script and accompanying file found in the Fungal_Database directory:

	perl bulk_download_JGI.pl MycoCosm_Download_Info.txt

<b>Note: You will need have <a href="https://curl.haxx.se/download.html">curl</a> installed.</b>

The mitochondrial and nuclear databases can be made using the these commands and requires the gzipped files downloaded in the previous step to be present in working directory:

Mitochondrial:

	perl make_fungal_db.pl mito

Nuclear:

	perl make_fungal_db.pl nuclear


The produced FASTA files are then used to make a <a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">bowtie2</a> index:

	bowtie2-build FASTA_file ID

Assuming paired end data, bowtie2 is used to identify reads that do not map to the fungal datasets:

	bowtie2 --very-sensitive-local --no-unal --un no_fungal_map_hits.fq --un-conc no_fungal_map_pair_hits.fq -x ID -1 PE_Read1 -2 PE_Read2  -S ID_no_organ.sam 

The files no_fungal_map* contain reads that did not map to the fungal datasets.

<h2>Fungal Genomes Used</h2>

<b>Nuclear Genome Species:</b><br>
	
	Aaosphaeria arxii CBS 175.79 v1.0				Exophiala alcalophila J33 v1.0					Paxillus ammoniavirescens Pou09.2 v1.0
	Absidia padenii NRRL 2977 v1.0					Fellomyces penicillatus Phaff54-35 v1.0				Periconia macrospinosa DSE2036 v1.0
	Absidia repens NRRL 1336 v1.0					Fennellomyces sp. T-0311 v1.0					Phaeoacremonium aleophilum UCRPA7
	Acaromyces ingoldii MCA 4198 v1.0				Fibulobasidium inconspicuum Phaff89-39 v1.0			Phanerochaete chrysosporium RP-78 v2.2
	Acephala macrosclerotiorum EW76-UTF0540 v1.0			Fistulina hepatica v1.0						Phialocephala scopiformis 5WS22E1 v1.0
	Acidothrix acidophila CBS 136259 v1.0				Fomitiporia mediterranea v1.0					Phlebia brevispora HHB-7030 SS6 v1.0
	Acremonium alcalophilum v2.0					Fonsecaea multimorphosa CBS 102226				Pholiota alnicola AH 47727 v1.0
	Agaricostilbum hyphaenes  ATCC MYA-4628 v1.0			Fusarium fujikuroi IMI 58289					Phyllosticta capitalensis CBS 128856 v1.0
	Agrocybe pediades AH 40210 v1.0					Gaeumannomyces graminis var. tritici R3-111a-1			Pichia membranifaciens v2.0
	Aliquandostipite khaoyaiensis CBS 118232 v1.0			Galerina marginata v1.0						Piedraia hortae v1.1
	Allomyces macrogynus ATCC 38327					Gautieria morchelliformis GMNE.BST v1.0				Pilaira anomala RSA1997 v1.0
	Alternaria alternata SRC1lrK2f v1.0				Gilbertella persicaria var. persicaria CBS 190.32-T v1.0	Piromyces sp. E2 v1.0
	Amanita muscaria Koide v1.0					Glarea lozoyensis ATCC 20868					Pisolithus microcarpus 441 v1.0
	Amniculicola lignicola CBS 123094 v1.0				Glomerella acutata (Colletotrichum fiorinae MH 18) v1.0		Plectosphaerella cucumerina DS2psM2a2 v1.0
	Amorphotheca resinae v1.0					Gonapodya prolifera v1.0					Plicaturopsis crispa v1.0
	Ampelomyces quisqualis HMLAC05119 v1.0				Gongronella butleri v1.0					Pluteus cervinus NL-1719 v1.0
	Anaeromyces robustus v1.0					Gremmeniella abietina DAOM 170408 v1.0				Pneumocystis jirovecii
	Anomoporia bombycina ATCC 64506 v1.0				Grosmannia clavigera kw1407					Podospora anserina S mat+
	Anthostoma avocetta NRRL 3190 v1.0				Guyanagaster necrorhiza MCA 3950 v1.0				Polyporus arcularius v1.0
	Apiospora montagnei NRRL 25634 v1.0				Gymnopus androsaceus JB14 v1.0					Porodaedalea chrysoloma FP-135951 v1.0
	Aplosporella prunicola CBS 121.167 v1.0				Gyromitra esculenta CBS101906 v1.0				Postia placenta MAD-698-R-SB12 v1.0
	Aporpium caryae L-13461						Hebeloma cylindrosporum h7 v2.0					Protomyces inouyei
	Armillaria gallica 21-2 v1.0					Heliocybe sulcata OMC1185 v1.0					Pseudozyma antarctica T-34
	Arthroderma benhamiae CBS 112371				Hesseltinella vesiculosa NRRL3301 v2.0				Pterula gracilis CBS309.79 v1.0
	Ascobolus immersus RN42 v1.0					Heterogastridium pycnidioideum ATCC MYA-4631 v1.0		Puccinia graminis f. sp. tritici v2.0
	Aspergillus aculeatinus CBS 121060 v1.0				Histoplasma capsulatum NAm1					Punctularia strigosozonata v1.0
	Atractiellales sp. v2.0						Hortaea acidophila CBS 113389 v1.0				Purpureocillium sp. UdeA0106 v1.0
	Aulographum hederae v2.0					Hyalopycnis blepharistoma ATCC 48560 v1.0			Pycnoporus cinnabarinus BRFM 137
	Auriculariopsis ampla NL-1724 v1.0				Hydnopolyporus fimbriatus CBS384.51 v1.0			Pyronema confluens CBS100304
	Babjeviella inositovora NRRL Y-12698 v1.0			Hymenopellis radicata IJFM A160 v1.0				Radiomyces spectabilis NRRL 2753 v1.0
	Backusella circina FSU 941 v1.0					Hyphopichia burtonii NRRL Y-1933 v1.0				Ramaria rubella (R. acris) UT-36052-T v1.0
	Basidiobolus meristosporus CBS 931.73 v1.0			Hysterium pulicare						Rhizopus microsporus var. chinensis CCTCC M201021
	Baudoinia compniacensis UAMH 10762 (4089826) v1.0		Ilyonectria robusta PMI_751 v1.0				Rhodotorula graminis strain WP1 v1.1
	Beauveria bassiana ARSEF 2860					Irpex lacteus CCBAS Fr. 238 617/93 v1.0				Rhytidhysteron rufulum
	Bimuria novae-zelandiae CBS 107.79 v1.0				Jaapia argillacea v1.0						Rickenella fibula HBK330-10 v1.0
	Biscogniauxia nummularia v1.0					Jaminaea sp. MCA 5214 v1.0					Rigidoporus microporus ED310 v1.0
	Bjerkandera adusta v1.0						Kalaharituber pfeilii F3 v1.0					Rozella allomycis CSF55
	Blastobotrys (Arxula) adeninivorans				Karstenula rhodostoma CBS 690.94 v1.0				Russula brevipes BPL707 v1.0
	Blastocladiella britannica v1.0					Kazachstania africana CBS 2517					Rutstroemia firma CBS 115.86 v1.0
	Blumeria graminis f.sp. hordei DH14				Khuskia oryzae ATCC 28132 v1.0					Saccharomyces cerevisiae S288C
	Boletus edulis v1.0						Kickxella alabastrina RSA 675 v1.0				Saitoella complicata NRRL Y-17804 v1.0
	Botryobasidium botryosum v1.0					Kluyveromyces lactis						Sarcoscypha coccinea ATCC 58028 v1.0
	Bulgaria inquinans CBS118.31 v1.0				Kockovaella imperatae NRRL Y-17943 v1.0				Schizophyllum commune H4-8 v3.0
	Byssothecium circinans CBS 675.92 v1.0				Kuraishia capsulata CBS 1993					Scleroderma citrinum Foug A v1.0
	Cadophora sp. DSE1049 v1.0					Laccaria amethystina LaAM-08-1 v2.0				Scytinostroma sp. KUC9335 v1.0
	Calocera cornea v1.0						Laetiporus sulphureus var. sulphureus v1.0			Sebacina vermifera MAFF 305830 v1.0
	Candida albicans SC5314						Lecythophora sp. AK0013 v1.0					Septoria musiva SO2202 v1.0
	Capronia coronata CBS 617.96					Leiotrametes sp BRFM 1775 v1.0					Serpula lacrymans var shastensis SHA21-2 v1.0
	Catenaria anguillulae PL171 v2.0				Lentinus tigrinus v1.0						Setomelanomma holmii CBS 110217 v1.0
	Cenococcum geophilum 1.58 v2.0					Lentithecium fluviatile v1.0					Sirobasidium intermedium CBS7805 v1.0
	Cephaloascus albidus ATCC 66658 v1.0				Leptosphaeria maculans						Sodiomyces alkalinus v1.0
	Ceratobasidium sp. (anastomosis group I, AG-I) v1.0		Leucosporidiella creatinivora 62-1032 v1.0			Spathularia flavida
	Chaetosphaeria innumera						Lichtheimia corymbifera JMRC:FSU:9682				Sphaerobolus stellatus v1.0
	Chionosphaera apobasidialis 52639 v1.0				Lindgomyces ingoldianus ATCC 200398 v1.0			Spinellus fusiger NRRL 22323 v1.0
	Choiromyces venosus 120613-1 v1.0				Lipomyces starkeyi NRRL Y-11557 v1.0				Sporormia fimetaria v1.0
	Chytridium lagenaria Arg66 v1.0					Lizonia empirigonia CBS 542.76 v1.0				Stanjemonium grisellum CBS 655.79 v1.0
	Circinella umbellata NRRL1351 v1.0				Lobaria pulmonaria Scotland v1.0				Stereum hirsutum FP-91666 SS1 v1.0
	Cladophialophora bantiana CBS 173.52				Lodderomyces elongisporus NRRL YB-4239				Sugiyamaella americana NRRL YB-2067 v1.0
	Climacocystis borealis CliBor001 v1.0				Lollipopaia minuta P26; CBS 116597 v1.0				Suillus americanus EM31 v1.0
	Clohesyomyces aquaticus v1.0					Lophiostoma macrostomum v1.0					Sympodiomyces attinorum NRRL Y-27639 v1.0
	Coccodinium bartschii CBS 121709 v1.0				Loramyces juncicola 46458 v1.0					Syncephalis fuscata S228 v1.0
	Coemansia reversa NRRL 1564 v1.0				Lycoperdon perlatum FP-102459-T v1.0				Talaromyces aculeatus ATCC 10409 v1.0
	Cokeromyces recurvatus NRRL 2243 v1.0				Macroventuria anomochaeta CBS 525.71 v1.0			Talaromyces marneffei ATCC 18224
	Colletotrichum acutatum CBS 112980 v2.0				Magnaporthe grisea v1.0						Taphrina deformans
	Coniosporium apollinis CBS 100218				Malassezia sympodialis ATCC 42132				Terfezia boudieri ATCC MYA-4762 v1.1
	Coprinopsis cinerea AmutBmut pab1-1 v1.0			Marssonina brunnea f. sp. multigermtubi MB_m1			Testicularia cyperi MCA 3645 v1.0
	Corynespora cassiicola CCP v1.0					Massarina eburnea CBS 473.64 v1.0				Thamnidium elegans v1.0
	Crepidotus variabilis CBS 506.95 v1.0				Meira miltonrushii MCA 3882 v1.0				Thermoascus aurantiacus v1.0
	Cronartium quercuum f. sp. fusiforme G11 v1.0			Melampsora allii-populina 12AY07 v1.0				Thielavia antarctica CBS 123565 v1.0
	Crucibulum laeve CBS 166.37 v1.0				Meredithblackwellia eburnea MCA 4105 v1.0			Thozetella sp. PMI_491 v2.0
	Cryptococcus curvatus ATCC 20509 v1.0				Metarhizium acridum CQMa 102					Tilletiopsis albescens v1.0
	Cucurbitaria berberidis CBS 394.84 v1.0				Meyerozyma guilliermondii ATCC 6260				Torulaspora delbrueckii CBS 1146
	Cunninghamella echinulata NRRL 1382 v1.0			Microdochium bolleyi J235TASD1 v1.0				Tothia fuscella CBS 130266 v1.0
	Cyathus striatus AH 40144 v1.0					Mixia osmundae IAM 14324 v1.0					Trametopsis cervina CIRM-BRFM 1824 v1.0
	Cyberlindnera jadinii NRRL Y-1542 v1.0				Monacrosporium haptotylum CBS 200.50				Tremella encephala 68-887.2 v1.0
	Cylindrobasidium torrendii FP15055 v1.0				Morchella conica CCBAS932 v1.0					Trichaptum abietinum v1.0
	Cyphellophora europaea CBS 101466				Mrakia frigida ATCC 22029 v1.0					Trypethelium eluteriae v1.0
	Cystostereum murrayi CysMur001 v1.0				Mucor cordense RSA 1222 v1.0					Tuber borchii Tbo3840 v1.0
	Cytidiella melzeri FP 102339 v1.0				Multifurca ochricompacta BPL690 v1.0				Tulasnella calospora AL13/4D v1.0
	Dacryopinax primogenitus DJM 731 SSP1 v1.0			Mutinus elegans ME.BST v1.0					Umbelopsis ramanniana AG # v1.0
	Daedalea quercina v1.0						Mycotypha africana NRRL 2978 v1.0				Uncinocarpus reesii 1704
	Daldinia eschscholzii EC12 v1.0					Myriangium duriaei CBS 260.36 v1.0				Usnea florida ATCC18376 v1.0
	Debaryomyces hansenii						Mytilinidion resinicola CBS 304.34 v1.0				Ustilago hordei Uh4857_4
	Decorospora gaudefroyi v1.0					Nadsonia fulvescens var. elongata DSM 6958 v1.0			Valetoniellopsis laxa CBS 191.97 v1.0
	Dekkera bruxellensis CBS 2499 v2.0				Naiadella fluitans ATCC 64713 v1.0				Vararia minispora EC-137 v1.0
	Delitschia confertaspora ATCC 74209 v1.0			Naohidea sebacea CBS 8477 (P95) v1.0				Venturia inaequalis
	Dendrothele bispora CBS 962.96 v1.0				Nematocida parisii ERTm1					Verticillium alfalfae VaMs.102
	Diaporthe ampelina UCDDA912					Neosartorya fischeri NRRL 181					Volvariella volvacea V23
	Dichomitus squalens LYAD-421 SS1 v1.0				Neurospora crassa OR74A v2.0					Vuilleminia comedens VcCUCC2015_SSI6 v1.0
	Didymella exigua CBS 183.55 v1.0				Niesslia exilis CBS 358.70 v1.0					Wallemia ichthyophaga EXF-994
	Dioszegia cryoxerica v1.0					Nosema ceranae BRL01						Westerdykella ornata CBS 379.55 v1.0
	Diplodia seriata DS831						Obba rivulosa 3A-2 v1.0						Wickerhamomyces anomalus NRRL Y-366-8 v1.0
	Dissoconium aciculare v1.0					Ogataea parapolymorpha DL-1					Wilcoxina mikolae CBS 423.85 v1.0
	Dothistroma septosporum NZE10 v1.0				Ogataea polymorpha NCYC 495 leu1.1 v2.0				Wolfiporia cocos MD-104 SS10 v1.0
	Elsinoe ampelina CECT 20119 v1.0				Oidiodendron maius Zn v1.0					Xanthoria parietina 46-1-SA22 v1.1
	Encephalitozoon cuniculi GB-M1					Omphalotus olearius						Xenasmatella vaga CBS212.54 v1.0
	Endocarpon pusillum Z07020					Onnia scaura P-53A v1.0						Xerocomus badius 84.06 v1.0
	Enterocytozoon bieneusi H348					Ophiobolus disseminans CBS 113818 v1.0				Xylona heveae TC161 v1.0
	Eremomyces bilateralis CBS 781.70 v1.0				Orpinomyces sp.							Yarrowia lipolytica (strain CLIB122)
	Eremothecium gossypii ATCC 10895				Oudemansiella mucida CBS 558.79 v1.0				Zasmidium cellare ATCC 36951 v1.0
	Erythrobasidium hasegawianum ATCC 9536 v1.0			Pachysolen tannophilus NRRL Y-2460 v1.2				Zopfia rhizophila v1.0
	Eurotium rubrum v1.0						Panaeolus papilionaceus CIRM-BRFM 715 v1.0			Zychaea mexicana RSA 1403 v1.0
	Eutypa lata UCREL1						Paracoccidioides brasiliensis Pb03				Zygoascus hellenicus Y-7136 v1.0
	Exidia glandulosa v1.0						Patellaria atrata v1.0						Zymoseptoria ardabiliae STIR04_1.1.1

<br>
<b>Mitchondrial Genome Species:</b><br>

	Absidia padenii NRRL 2977 v1.0							Gymnopus earleae GB-263.02 v1.0				Rhodotorula sp. J31 v1.0
	Aliquandostipite khaoyaiensis CBS 118232 v1.0					Hymenoscyphus varicosporoides PMI_453 v1.0		Rigidoporus microporus ED310 v1.0
	Auriculariopsis ampla NL-1724 v1.0						Ilyonectria robusta PMI_751 v1.0			Russula brevipes BPL707 v1.0
	Biscogniauxia nummularia v1.0							Irpex lacteus CCBAS Fr. 238 617/93 v1.0			Sclerophora sanguinea CBS100924 v1.0
	Blastocladiella britannica v1.0							Kickxella alabastrina RSA 675 v1.0			Sparassis latifolia CCMJ1100 v1.0
	Bolbitius vitellinus SZMC-NL-1974 v1.0						Kockovaella imperatae NRRL Y-17943 v1.0			Spinellus fusiger NRRL 22323 v1.0
	Cerinomyces ceraceus ATCC 56525 v1.0						Lactarius quietus S23C v1.0				Syncephalis fuscata S228 v1.0
	Chionosphaera cuniculicola CBS10063  v1.0					Lecythophora sp. AK0013 v1.0				Talaromyces proteolyticus PMI_201 <v1 class="0"></v1>
	Chytridium lagenaria Arg66 v1.0							Lobaria pulmonaria Scotland v1.0			Terfezia claveryi T7 v1.0
	Circinella umbellata NRRL1351 v1.0						Lophiotrema nucula CBS 627.86 v1.0			Trametes gibbosa CIRM-BRFM 1770 v1.0
	Cladorrhinum bulbillosum DJ3 v1.0						Lycoperdon perlatum FP-102459-T v1.0			Trichophaea hybrida UTF0779 v1.0
	Clitocybe gibba IJFM A808 v1.0							Mariannaea sp. PMI_226 v1.0				Tuber borchii Tbo3840 v1.0
	Coemansia spiralis RSA 1278 v1.0						Massariosphaeria phaeospora CBS 611.86 v1.0		Umbelopsis sp. nov. AD052 v1.0
	Cokeromyces recurvatus NRRL 2243 v1.0						Melanotaenium endogenum CBS481.91 v1.0			Usnea florida ATCC18376 v1.0
	Colletotrichum acutatum CBS 112980 v2.0						Mortierella multidivaricata RSA 2152 T v1.0		Vuilleminia comedens VcCUCC2015_SSI6 v1.0
	Cryptodiaporthe populea CFL2025 v1.0						Mucor cordense RSA 1222 v1.0				Wickerhamiella domercqiae NRRL Y-6692 v1.0
	Cunninghamella echinulata NRRL 1382 v1.0					Mucor heterogamus NRRL 1489 v1.0			Xenasmatella vaga CBS212.54 v1.0
	Cystostereum murrayi CysMur001 v1.0						Multifurca ochricompacta BPL690 v1.0			Xylariales sp. PMI_506 v1.0
	Cytidiella melzeri FP 102339 v1.0						Mycotypha africana NRRL 2978 v1.0			Yarrowia lipolytica FKP355 v1.0
	Delphinella strobiligena CBS 735.71 v1.0					Oudemansiella mucida CBS 558.79 v1.0	
	Didymocrea sadasivanii CBS 438.65 v1.0						Panaeolus papilionaceus CIRM-BRFM 715 v1.0	
	Entophlyctis helioformis JEL805 v1.0						Phascolomyces articulosus v1.0	
	Eurotium rubrum v1.0								Pholiota alnicola AH 47727 v1.0	
	Exophiala alcalophila J33 v1.0							Phyllosticta capitalensis CBS 128856 v1.0	
	Fennellomyces sp. T-0311 v1.0							Phyllosticta citribraziliensis CBS 100098 v1.0	
	Gaertneriomyces semiglobifer Barr 43 v1.0					Pilaira anomala RSA1997 v1.0	
	Gilbertella persicaria var. persicaria CBS 190.32-T v1.0			Purpureocillium sp. UdeA0106 v1.0	
	Gloeopeniophorella convolvens OM19405 v1.0					Pycnoporus cinnabarinus CIRM-BRFM 50 v1.0	
	Gongronella butleri v1.0							Radiomyces spectabilis NRRL 2753 v1.0	
	Gremmeniella abietina DAOM 170408 v1.0						Rhodotorula glutinis v1.0	


<br>

<h1>GC Content</h1>

The script <code>get_gc_content.pl</code> can be used to estimate the GC content from FASTQ reads.  This script requires FASTQ files to be present in the working directory. The files must have the ending ".fq" or ".fastq". 

To run the script, simply call with Perl:

	perl get_gc_content.pl

The output file is called GC_content.txt and include the percent AT, percent GC, and total base pairs for the FASTQ files.

<h1>References</h1>

* Grigoirev, I. V., R. Nikitin, S. Haridas, A. Kuo, R. Ohm, R. Otillar, R. Rile, A. Salamov, X. Zhao, F. Korzeniewski, T. Smirnova, H. Nordberb, I. Dubchak, and I. Shabalov. 2014. MycoCosm portal: gearing up for 1000 fungal genomes. <i>Nucleic Acids Research</i>, 1(42):D699-D704. doi: <a href="https://academic.oup.com/nar/article-lookup/doi/10.1093/nar/gkt1183">10.1093/nar/gkt1183</a>

