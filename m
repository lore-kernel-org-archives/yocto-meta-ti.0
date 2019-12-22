Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.1841.1577043347787439179
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 11:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ope6gMCt;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id d71so4169700qkc.0
        for <meta-ti@lists.yoctoproject.org>; Sun, 22 Dec 2019 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=eT6vV3haj1FUnnCqFmt5G+BplWQ3x9d1n6alkp2UfJw=;
        b=ope6gMCtrWI/jH35zdB+ua91CTGsdxZfMrB0+T9cpvXQW+nb7JN2MG3bgnDwF4wiqO
         ilEsuzf2LH84Cn0XPKVihOfSnfMd/4yYHZ/lqbfGmO3dYPCEJgwgVJRL8gHXm6JPsE8e
         kJT/4rT5DLzBb8QdQRaViZxUSrg20m6p+VyjAKDsaLmvNXwfsHk8sH1aeBSP43zLSVUZ
         bVsOp2xMwsmY2LnpzUV3THbhRH8IFv8h9j5FxCI8E9UCFYAB5toLk4dIzLUQdXCnqd4I
         jpBBGYAl18EQb3Q4+0na9WtAjVqsTcjSeQcLZx0PmMJtdI66rjoDXqF3TVvm+Wks1naA
         Q3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=eT6vV3haj1FUnnCqFmt5G+BplWQ3x9d1n6alkp2UfJw=;
        b=rWB8OCxQZ0K6eQtt+gU5hGAEwM5HaK/n5uiwCofHgDAnZkbj9AKkF+bPICHqDRD8ug
         SkaJz+sItOYs1QvbItFRPV6Ulh3GjcLH8KXZvtf1BKcZvdxsKck/dU9iXBhaKXzBgFcR
         9wT7JNnJLjSp+Y19e6elucIJ5AiagahtQCWa5Jrqu28BOyxN/N/rfBjfJRuX5dSsRsWO
         ym5kJgmurH7jsEd46jYUmb1SzpzTG9FD2pFN38XI2GuMJZH5JyC8t8CQ3lxsvrEpeszj
         jYMuXD+vselIZb9Zyy5dkqD4exTe8sofQTmzLd6qzE+B/p3U2qDRsop5cSw6OT8n2J5O
         xsJQ==
X-Gm-Message-State: APjAAAXoTNWnVKwhcY82JjNiuM9i19BT9wQ492Z1uXVAZY0R4O+gctW/
	95JDGYgiMIv17pPtlM/tt8HA5aJ5K2U6hOE9AndfgXDsz5g=
X-Google-Smtp-Source: APXvYqxbB7Naufite/zTC+TYWVObn1gS85YOeXGqKV2WghnAPLTT0OPJ1lqp7rRkOlvAcSNaGJgZsh659p0g4ZAsgIU=
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr23321480qke.212.1577043346563;
 Sun, 22 Dec 2019 11:35:46 -0800 (PST)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 22 Dec 2019 11:35:20 -0800
Message-ID: <CAMKF1spqBMcmPvE9-8dBWb0qzNVsBRO-zaSGTSgHw-gp4StPdA@mail.gmail.com>
Subject: No generic license file exists for: Patrick-Powell in any provider
To: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi

bitbake emits this warning during parse when meta-ti is in play

WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic
license file exists for: Patrick-Powell in any provider

following recipes seems to be using Patrick-Powell license, but its
not defined anywhere it seems
perhaps a file with appropriate text should be added to meta-ti/licenses

recipes-ti/devtools/ti-cgt-arm_18.12.1.bb:LICENSE = "(TI-TSPA &
Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD &
BSD-4-Clause"
recipes-ti/devtools/ti-cgt6x_8.3.2.bb:LICENSE = "(TI-TSPA &
Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"
recipes-ti/devtools/ti-cgt7x_1.2.0.bb:LICENSE = "(TI-TSPA &
Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"

Cheers
-Khem
