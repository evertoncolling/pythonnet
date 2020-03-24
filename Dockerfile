FROM jonemo/pythonnet:python3.7.4-mono5.20-pythonnet2.4.0

# =========== Basic Configuration ======================================================
RUN pip install numpy matplotlib scipy scikit-learn cognite-sdk \
    jupyter jupyterlab plotly dash gekko tensorflow keras sympy \
    ipywidgets

RUN apt update && apt install -y build-essential && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt install -y nodejs && apt install -y sudo && \
    apt install libmono-microsoft-visualbasic10.0-cil

# ========== Create an user and environmental variables associated to it ===============
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# ============ Set some environmental vars and change user =============================
USER docker
ENV USER docker
WORKDIR /home/docker/
CMD ["jupyter", "notebook"]
