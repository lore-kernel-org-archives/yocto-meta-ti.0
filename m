Return-Path: <fromm@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44BD7E0070B
	for <meta-ti@yoctoproject.org>; Fri, 29 Jun 2012 08:41:26 -0700 (PDT)
Received: by bkty7 with SMTP id y7so182150bkt.35
	for <meta-ti@yoctoproject.org>; Fri, 29 Jun 2012 08:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=4I8i05GdEzJhFqzksEc99OExyIp3/tG/n9GCNJUnzrQ=;
	b=lLujJQPsAQkm40MaD/SZ4dSUVeFcZ/ochhGQbFpOx0QPITUrHNObyqbdL+qfzF8Lcb
	vg116mRTMQaNowGfOG4Ej5wepvYc39MhTAISJG5l1HjqcgH9Cb8jKbJ4dOQfwb/UBepf
	F8NQsTv3XTCRPTrF49pMWAzEAmkGUEgS8KtfB9PYaZCR377rd5ViwhJY4GzoQVUYtzvc
	q5Wq/rDSHh75bMGWH2TWxZYI/lDuQGco4droayaMEccUB3h/5nk3hs7NlT5Dii0TbR1l
	vGXMgKJLMNNSMih1uaJL62BwJoRR1FfA1Qjh9T4gWI21WHjvGbTSVG/amkjjU5e6zjmY
	fAiQ==
MIME-Version: 1.0
Received: by 10.152.102.234 with SMTP id fr10mr2461840lab.32.1340984485582;
	Fri, 29 Jun 2012 08:41:25 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 29 Jun 2012 08:41:25 -0700 (PDT)
Date: Fri, 29 Jun 2012 17:41:25 +0200
Message-ID: <CADZ6=asq0+CsUAackcJ4JjyqS0Dtq79SCHo7ccCyhup2CDHLOQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: meta-ti@yoctoproject.org
X-Gm-Message-State: ALoCoQn4ccAzPS3yzVVCoYUk6CTOJaNEgO+IKgdGWo8Nie2zKvwxTyMrrn4pgD3CWA55aaQATTSZ
Cc: team-leonardo <team-leonardo@dresearch-fe.de>
Subject: u-boot: pinned revision refers to broken u-boot for ti8148
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 15:41:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

meta-texasinstruments/recipes-bsp/u-boot/u-boot_2010.06-psp.bb pins a
broken revision of TI's fork of U-Boot for ti8148.
The revision pinned by the recipe, which is
5fcf46a405fe8e8a59a04d3cebdafd39ac0c4bd0, does not even boot the 8148
EVM board.

A more comprehensive bug report (including a detailed description on
how to reproduce the problem) is in our bug tracker:
<https://github.com/DFE/HidaV/issues/15>.

An overview of all Texas Instruments issues related to bugs in
ti81xx-Support we encountered are here:
<https://github.com/DFE/HidaV/issues?labels=3DTexas+Instruments&page=3D1&st=
ate=3Dopen>

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

