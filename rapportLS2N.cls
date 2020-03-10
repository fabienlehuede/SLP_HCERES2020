%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% 
%
%                 RAPPORT HCERES 2020 LS2N
%	         FICHE DE STYLE ET COMMANDES
%
%
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

% template book et option
\PassOptionsToClass{a4paper,twoside}{book}
\LoadClass{book}

%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Chargement de paquetages additionnels =
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{kpfonts}
\usepackage[autostyle]{csquotes}
\usepackage{xstring} % définit \StrRemoveBraces
\usepackage[hyphens]{url} % pour que le texte ne depasse pas des marges
\usepackage{etoolbox} % pour les conditions if then
\usepackage[nottoc,numbib]{tocbibind} % pour biblio dans table des matières
\usepackage{chngcntr}
\usepackage{array}
\usepackage{wrapfig}
\usepackage{multirow}
\usepackage{tabularx}
\usepackage{tikz} % pour utiliser foreach

\usepackage{enumitem} % pour itemize
\setlist[itemize]{topsep=0pt,itemsep=-1ex,partopsep=1ex,parsep=0ex}
\setlist[enumerate]{topsep=0pt,itemsep=-1ex,partopsep=1ex,parsep=1ex}
\@ifundefined{\string\pdfstringdefDisableCommands}{
  \relax}{\pdfstringdefDisableCommands{\let\\\textbackslash}}%
  %reduction espace item
\let\tempone\itemize
\let\temptwo\enditemize
\renewenvironment{itemize}{\tempone\addtolength{\itemsep}{0.5\baselineskip}}{\temptwo}

\usepackage{amssymb}


% couleurs

\usepackage{colortbl}


\definecolor{darkRed}{rgb}{0.65,0,0}
\definecolor{lightGray}{rgb}{.75,.75,.75}
\definecolor{darkBlue}{rgb}{0,.22,.41}
\definecolor{darkGray}{rgb}{.40,.40,.40}
\definecolor{orange}{rgb}{0.97,0.53,0.38}
\definecolor{seagreen}{rgb}{0.18, 0.55, 0.34}

% Définition de la variable listant toutes les équipes
\def\listeEquipes{SLP}
 

% package biber pour la biblio et option
\usepackage[backend=biber,giveninits=true,defernumbers=true,maxnames=9999,sorting=ydnt]{biblatex}

%\foreach \equipe in \listeEquipes {
%	\addbibresource{equipes/\equipe/annexes/\MakeLowercase{\equipe}.bib}
%}
\addbibresource{equipes/SLP/annexes/SLP.bib}
%\addbibresource{equipes/SLP/annexes/20152016_slp.bib}

\DeclareFieldFormat*{title}{\textit{\textbf{#1}}} % titre publication en gras

%%%%%%%%%%%%%%   commandes commentaires
\newboolean{comment} 

\newcommand{\CommentairesHCERES}[1]{
\ifcomment\textcolor{MidnightBlue}{\textit{\footnotesize#1}}\fi}

\newcommand{\CommentairesDirection}[1]{
\ifcomment\textcolor{seagreen}{\textit{\footnotesize#1}}\fi}


% Liste d'auteurs sélectionnées
\newcommand*{\ls@n@selection}{}

% Supprime un auteur de la liste des auteurs sélectionnés
\newcommand\ls@n@removeselectedauthor[1]{%
  \csundef{ls@n@selected@author@#1}%
}

% Supprime tous les auteurs sélectionnés
\newcommand\clearselectedauthors{%
  \forlistloop{\ls@n@removeselectedauthor}{\ls@n@selection}%
  \renewcommand\ls@n@selection{}%
}

% Ajoute un auteur à la liste des auteurs sélectionnés
% FIXME: ne vérifie pas s'il y a des doublons
\newcommand\selectauthor[1]{%
  \listadd\ls@n@selection{#1}%
  \csdef{ls@n@selected@author@#1}{\relax}%
}
% Ajoute plusieurs auteurs, séparés par des virgules, à la
% liste des auteurs sélectionnés
% FIXME: ne vérifie pas s'il y a des doublons
\newcommand\selectauthors[1]{%
  \forcsvlist{\selectauthor}{#1}%
}

% Détermine si un auteur est sélectionné
\newcommand\ifselectedauthor[1]{%
  \nameparts{#1}%
  \begingroup%
    \def\bibnamedelima{ }%
    \def\bibnamedelimb{ }%
    \def\bibnamedelimc{ }%
    \def\bibnamedelimd{ }%
    \def\bibnamedelimi{ }%
    \StrRemoveBraces{\namepartgiven}[\machin]%
    \StrRemoveBraces{\namepartprefix}[\de]%
    \StrRemoveBraces{\namepartfamily}[\bidule]%
    \edef\x{\endgroup\noexpand\ifcsdef{ls@n@selected@author@\machin\space\ifdefvoid{\de}{}{\de\space}\bidule}}\x%
}

% Met en gras les auteurs sélectionnés
\renewbibmacro*{name:hook}[1]{%
  \ifselectedauthor{#1}{\bfseries}{}%
}

% Remplace les auteurs non sélectionnés par des tirets dans les listes de plus
% de 15 coauteurs.
\DeclareNameFormat{author}{%
  \ifselectedauthor{#1}%
  {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  {\ifthenelse{\value{listtotal} > 15}
    {\textemdash}
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}}%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}


\DeclareFieldFormat*{labelnumberwidth}{%
  \ifkeyword{braket}{\textbf{\mkbibbrackets{#1}}}{\mkbibbrackets{#1}}}

% Définit des bibliographies de niveau paragraphe
\defbibheading{paragraph}[\refname]{%
  \paragraph*{#1}%
  \if@twoside\markright{\abx@MakeMarkcase{#1}}\fi}

% Redéfinit les bibliographies pour insertion en sections
\defbibheading{subbibintoc}[\refname]{%
  \subsubsection{#1}%
  \if@twoside\markright{\abx@MakeMarkcase{#1}}\fi}

\DeclareSourcemap{
    \maps[datatype=bibtex]{
      \map{
        \step[fieldsource=hal_local_reference]
        \step[fieldset=usera,origfieldval]
    }
  }
}

\DeclareBibliographyCategory{revue}

\DeclareBibliographyCategory{ouvrage}
\DeclareBibliographyCategory{dirouv}
\DeclareBibliographyCategory{chapitre}

\DeclareBibliographyCategory{actes}
\DeclareBibliographyCategory{conf}

\DeclareBibliographyCategory{logiciel}
\DeclareBibliographyCategory{brevet}
\DeclareBibliographyCategory{rapport}
\DeclareBibliographyCategory{autre}
\DeclareBibliographyCategory{poster}
\DeclareBibliographyCategory{these}
\DeclareBibliographyCategory{ouvulga}


% Affecte une catégorie unique à chaque entrée bibliographique
\AtDataInput{%
  \iffieldequalstr{usera}{DOUV}%
    {
    	\ifentrytype{book}%
        {\addtocategory{dirouv}{\thefield{entrykey}}}% sinon si type='book' -> dirouv
        {\addtocategory{actes}{\thefield{entrykey}}}% sinon si type='proceedings' -> actes 
    }      
    {\iffieldequalstr{usera}{OV}%
      {\addtocategory{ouvulga}{\thefield{entrykey}}}% sinon si 'OV' -> ouvulga
      {\iffieldequalstr{usera}{SOFTWARE}%
        {\addtocategory{logiciel}{\thefield{entrykey}}}% sinon si 'SOFTWARE' -> logiciel
        {\iffieldequalstr{usera}{BRE}%
          {\addtocategory{brevet}{\thefield{entrykey}}}% sinon si 'BRE' -> brevet
          {\iffieldequalstr{type}{Theses}%
            {\addtocategory{these}{\thefield{entrykey}}}% sinon si champ type='Theses' -> these
            {\iffieldequalstr{note}{Poster}%
              {\addtocategory{poster}{\thefield{entrykey}}}% sinon si note='poster' -> poster
              {\ifentrytype{book}%
                {\addtocategory{ouvrage}{\thefield{entrykey}}}% sinon si type='book' -> ouvrage
                {\ifentrytype{article}%
                  {\addtocategory{revue}{\thefield{entrykey}}}% sinon si type='article' -> revue
                  {\ifentrytype{incollection}%
                    {\addtocategory{chapitre}{\thefield{entrykey}}}% sinon si type='incollection' -> chapitre
                    {\ifentrytype{patent}%
                      {\addtocategory{brevet}{\thefield{entrykey}}}% sinon si type='patent' -> brevet
                      {\ifentrytype{proceedings}%
                        {\addtocategory{actes}{\thefield{entrykey}}}% sinon si type='proceedings' -> actes
                        {\ifentrytype{phdthesis}%
                          {\addtocategory{these}{\thefield{entrykey}}}% sinon si type='phdthesis' -> these
                          {\ifentrytype{inproceedings}%
                            {\addtocategory{conf}{\thefield{entrykey}}}% sinon si type='inproceedings' -> conf
                              {\addtocategory{autre}{\thefield{entrykey}}}% sinon -> non classé
                          }%
                        }%
                      }%
                    }%
                  }%
                }%
              }%
            }%
          }%
        }%
      }%
    }%
}

\setcounter{tocdepth}{5} % + subsubsections
\setcounter{secnumdepth}{5}

\usepackage{tgadventor}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\usepackage[french]{babel}

\usepackage{color}
\usepackage{colortbl}
\usepackage{tcolorbox}% pour le SWOT
\usepackage{fancyhdr}
\pagestyle{fancy}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{url}
\usepackage{wrapfig}
\usepackage{datetime}
\usepackage[]{graphicx}

\RequirePackage{datatool} %package pour l'insértion et la mise en forme des tableau via fichier csv
\RequirePackage{booktabs} %package pour l'insértion et la mise en forme des tableau via fichier csv
\RequirePackage{float} %package pour les tableaux


%%%%%%%%%%%%%%%%%%%%%%% fin paquetages additionnels 



%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{gris}{gray}{0.97}
\definecolor{gris2}{gray}{0.9}
\definecolor{rouge}{rgb}{0.9,0,0.28}
\definecolor{violet}{rgb}{0.28,0.05,0.48}
\definecolor{bleu}{rgb}{0.20,0.10,0.90}
\definecolor{bleuf}{rgb}{0.15,0.10,0.55}
\definecolor{blanc}{RGB}{255,255,255} 
\usepackage[colorlinks = true,
            linkcolor =bleuf,
            urlcolor  = blue,
            citecolor = blue,
            anchorcolor = blue]{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\headheight}{3cm}
\setlength{\footskip}{8.4pt}
 
\fontencoding{T1}
\fontfamily{TeX Gyre Adventor} 
\newcommand{\ALL}{all}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMMANDES et REDEFINITION DE COMMANDES    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pour afficher mois/annee dans footer
\newdateformat{mydateformat}{\monthname~\THEYEAR}
\newcommand{\nomequipe}{xxx}

\newenvironment{TableauCinq}[1]{%
\def\rowtab##1##2##3##4##5{##1 & ##2 & ##3 & ##4 & ##5 \\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{tabular}{m{3cm} m{3cm} m{3cm} m{2.9cm} m{1.9cm}}
\hline
\multicolumn{5}{>{\color{white} \columncolor{darkRed}} c}{\bfseries #1}\\
}
{\end{tabular}
}


\newenvironment{TableauSix}[1]{%
\def\rowtab##1##2##3##4##5##6{##1 & ##2 & ##3 & ##4 & ##5 & ##6\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{tabular}{m{2.5cm} m{2.5cm} m{2.4cm} m{2.4cm} m{1.8cm} m{1.8cm}}
\hline
\multicolumn{6}{>{\color{white} \columncolor{darkRed}} c}{\bfseries #1}\\
\hline
}
{\end{tabular}
}


\newenvironment{TableauSept}[1]{%
\def\rowtab##1##2##3##4##5##6##7{##1 & ##2 & ##3 & ##4 & ##5 & ##6 & ##7\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{tabular}{|m{2,5cm}|m{2,5cm}|m{1,5cm}|m{1,5cm}|m{1,5cm}|m{1,7cm}|m{1,7cm}|}
\hline
\multicolumn{7}{>{\color{white} \columncolor{darkRed}} c}{\bfseries #1}\\
\hline
}
{\end{tabular}
}


% creation d'un tableau à 6 colonnes
\newenvironment{TableauSixContrat}[1]{%
\def\rowtab##1##2##3##4##5##6{##1 & ##2 & ##3 & ##4 & ##5 & ##6\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{center}
\begin{tabular}{m{1.7cm} m{2.8cm} m{2,5cm} m{2cm} m{2cm} m{2.2cm}}
\hline
\multicolumn{6}{>{\color{white} \columncolor{red}} c}{\bfseries #1}\\
\hline
}
{\end{tabular}
\end{center}
}



    %%%%%%%%%%%%%%%%%  affichage détaillé d'un contrat %%%%%%%%%%%%%%%%%%%%%%%%%
    
   

\newcommand{\affTableauDetailContratsPub}[2]{
\DTLforeach*{#1contratpub}{\lienref=lienreference,\nom=Nomducontrat,\coordinateur=Coordinateur,\type=TypeProgrammeFinancement,\listePartenaires=Partenaires,\ListeNomPartenaires=Membresdesprincipauxpartenaires,\ParticipantsContrat=Participantsequipe,\debut=Debut,\duree=Duree,\responsable=ResponsablescientifiqueLINA,\montantContratEquipe=Montantequipe,\montantContratGlobal=Montanttotal,\champMotsCle=Motscles,\champResume=Resume}
{
\ifx\empty\lienref\else\label{\lienref}\hypertarget{\lienref}{}\fi
\begin{UnContrat}{\nom}
  \UrlDOI{}
  \DebutContrat{\debut}  
  \Type{\type}
  \Duree{\duree}
  \Responsable{\responsable}
  \MontantEquipe{\montantContratEquipe}
  \MontantTotal{\montantContratGlobal}
  \MotsCles{\champMotsCle}
  \Resume{\champResume}
  \Participants{\ParticipantsContrat}
  \Partenaires{\listePartenaires}
  %\NomPartenaires{\ListeNomPartenaires}
  \Coordinateur{\coordinateur}
  \begin{Description}
  \end{Description}
\end{UnContrat}
}
\DTLcleardb{#1contratpub}
\DTLdeletedb{#1contratpub}
\vfill
\rule[\baselineskip]{0pt}{\baselineskip}
}


 
\newsavebox{\@DescriptionContratBox}
\newbox{\@@DescriptionContratBox}
\newenvironment{UnContrat}[1]{%
 \global\let\@UrlSysteme\@empty
  \global\let\@UrlSystemeBreakLines\@empty
  \gdef\@NomContrat{#1}
  \def\Type##1{\gdef\@Type{##1}}
  \def\DebutContrat##1{\gdef\@DebutContrat{##1}}
  \def\Duree##1{\gdef\@Duree{##1}}
  \def\MontantEquipe##1{\gdef\@MontantEquipe{##1}}
  \def\MontantTotal##1{\gdef\@MontantTotal{##1}}
  \def\Responsable##1{\gdef\@ResponsableContrat{##1}}
  \def\Participants##1{\gdef\@ParticipantsContrat{##1}}
\def\Coordinateur##1{\gdef\@CoordinateurContrat{##1}}
  \def\Partenaires##1{\gdef\@PartenairesContrat{##1}}
  %\def\NomPartenaires##1{\gdef\@NomPartenairesContrat{##1}}
 \def\UrlDOI##1{\gdef\@UrlSysteme{##1}}
  \def\UrlDOIBreakLines##1{\gdef\@UrlSystemeBreakLines{##1}}
  \def\Description{\begin{lrbox}{\@DescriptionContratBox}%
      \noindent\begin{minipage}{\textwidth}\itshape}
      \def\endDescription{\end{minipage}\end{lrbox}%
     \global\setbox\@@DescriptionContratBox=\vbox{\copy\@DescriptionContratBox}}
\global\let\@MotsCles\@empty  % ajout de condition pour mots clÃ©s 30/03/10
\def\MotsCles##1{\gdef\@MotsCles{##1}}
\global\let\@Resume\@empty  % ajout de condition pour resumé 30/03/10
\def\Resume##1{\gdef\@Resume{##1}}

}{%
%  \addtocontents{toc}{\@subsectionfillfalse}
 {\noindent\textbf{\if\@Type \else{\@Type~- }\fi \@NomContrat} \if\@CoordinateurContrat \else \hfill\normalsize\mdseries \textbf{Coordinateur~:} \@CoordinateurContrat
\fi
\if\@UrlSysteme
\par
\else
 {\small\texttt{\href{\@UrlSysteme}{\textbf{URL}}}} %modif2708 on rend clickable le mot URL
\fi
  }\\
\noindent\textbf{D\'ebut~:} \@DebutContrat, \textbf{dur\'ee~:} \@Duree \hspace*{0.1cm}mois \par
\if\@PartenairesContrat
\par
\else
\noindent\textbf{Partenaires :} \@PartenairesContrat\par
\fi
\noindent\textbf{Responsable scientifique LINA : } \@ResponsableContrat \par
\if\@ParticipantsContrat
\par 
\else
\noindent\textbf{Participants \'equipe :} \@ParticipantsContrat \par
\fi
\noindent\textbf{Montant \'equipe :} \@MontantEquipe \hspace*{0.1cm}K~€
\if\@MontantTotal
\else 
\hfill\normalsize\mdseries \textbf{Montant total :} \@MontantTotal \hspace*{0.1cm}K~€
\fi \par
% ajout de condition pour mots clÃ©s 30/03/10
\if\@MotsCles
\par
\else
\noindent\textbf{Mots cl\'es :}
 \@MotsCles \par
\fi
\if\@Resume
\par
\else
\noindent\textbf{Résumé :}
 \@Resume\par
\fi
  \medskip
  \vbox{\unvcopy\@@DescriptionContratBox}
}




     %%%%%%%%%%%%%%%%%  affichage synthese d'un contrat %%%%%%%%%%%%%%%%%%%%%%%%%
 
                % contrat public %

\newcommand{\affTableauRecapContratspub}[2]{
\label{CI-#2}
\DTLloaddb{#1contratpub}{./equipes/#2/annexes/contratspub_#2.csv}
\def\total{0}
\begin{table}[H]
\label{#1:contratpub}
\centering
\begin{TableauSixContrat}{Contrats institutionnels sur financement public}
\toprule
\bfseries Type &
\bfseries Nom &
\bfseries Gestionnaire &
\bfseries Début &
\bfseries Durée (mois) &
\bfseries Montant (K~€)
\DTLforeach*[\DTLiseq{\programme}{AAPI}]{#1contratpub}{\programme=ProgrammeFinancement,\type=TypeProgrammeFinancement,\nom=Nomducontrat,\institution=GestionpartutellesouDivers,\debut=Debut,\duree=Duree,\montant=Montantequipe}
{\addbibresource{equipes/ARMEN/annexes/armen.bib}
\addbibresource{equipes/AELOS/annexes/aelos.bib}
\addbibresource{equipes/IPI/annexes/ipi.bib}
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AAPI}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\type}{}}{& \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}{\type & \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}}
\DTLforeach*[\DTLiseq{\programme}{AAPN}]{#1contratpub}{\programme=ProgrammeFinancement,\type=TypeProgrammeFinancement,\nom=Nomducontrat,\institution=GestionpartutellesouDivers,\debut=Debut,\duree=Duree,\montant=Montantequipe}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AAPN}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\type}{}}{& \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}{\type & \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}}
\DTLforeach*[\DTLiseq{\programme}{AAP tutelles}]{#1contratpub}{\programme=ProgrammeFinancement,\type=TypeProgrammeFinancement,\nom=Nomducontrat,\institution=GestionpartutellesouDivers,\debut=Debut,\duree=Duree,\montant=Montantequipe}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AAP tutelles}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\type}{}}{& \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}{\type & \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}}
\DTLforeach*[\not\DTLiseq{\programme}{AAPI}\and\not\DTLiseq{\programme}{AAPN}\and\not\DTLiseq{\programme}{AAP tutelles}]{#1contratpub}{\programme=ProgrammeFinancement,\type=TypeProgrammeFinancement,\nom=Nomducontrat,\institution=GestionpartutellesouDivers,\debut=Debut,\duree=Duree,\montant=Montantequipe}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AUTRES}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\type}{}}{& \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}{\type & \nom & \institution & \debut & \duree & \DTLgadd{\total}{\montant}{\total} \hfill\montant}}
\\\hline \hline
& & & & \multicolumn{2}{r}{Montant total équipe : \total}
\\\bottomrule
\hline
\end{TableauSixContrat}
\end{table} 
} 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






	%%%%%%%%%%%%%%%%%  affichage des brevets  %%%%%%%%%%%%%%%%%%%%%%%%%

\newsavebox{\@DescriptionBrevetBox}
\newbox{\@@DescriptionBrevetBox}
\newenvironment{UnBrevet}[1]{%
  \gdef\@NomContrat{#1}
\def\InventeursLabo##1{\gdef\@InventeursLabo{##1}}
\def\Statut##1{\gdef\@Statut{##1}}
  \def\Description{\begin{lrbox}{\@DescriptionBrevetBox}%
      \noindent\begin{minipage}{\textwidth}\itshape}
      \def\endDescription{\end{minipage}\end{lrbox}%
     \global\setbox\@@DescriptionBrevetBox=\vbox{\copy\@DescriptionBrevetBox}}
}{%
\noindent\textbf{\@NomContrat} \par
\noindent\textbf{Coordinateur :} \@InventeursLabo \par
\noindent\textbf{Statut :} \@Statut
\par
  \medskip
  \vbox{\unvcopy\@@DescriptionBrevetBox}
}


\newcommand{\affDetailBrevet}[2]{
\DTLloaddb{#1brevet}{./equipes/#2/annexes/brevets_#2.csv}
\DTLforeach*{#1brevet}{\statut=statut,\nom=Intitule,\inventeursLabo=inventeursLS2N}
{
\begin{UnBrevet}{\nom}
  \Statut{\statut}
  \InventeursLabo{\inventeursLabo}
  \begin{Description}
  \end{Description}
\end{UnBrevet}
}
\DTLcleardb{#1brevet}
\DTLdeletedb{#1brevet}
\vfill
\rule[\baselineskip]{0pt}{\baselineskip}
}
