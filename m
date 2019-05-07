Return-Path: <fgd7806@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F904E00D47; Tue,  7 May 2019 10:42:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (fgd7806[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.170 listed in list.dnswl.org]
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8A2CE00D40
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2019 10:42:37 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id j6so20060074qtq.1
	for <meta-ti@yoctoproject.org>; Tue, 07 May 2019 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DeZ4UstUfuY6JO2Mu9NM2Sbs33OlYgqSxnmM/2vMU4A=;
	b=Gjlqlfi0Gzb10R2xVU06kXCZs0a9QYArWKj0thvhEg0dbVZY3VWiTNgByB5l8fclv/
	zLnjiUyEflZCMmR4sFwOGXxSI/oqVGLTqOx6uH/MiwUcF/tWGskVZYXCOg79fTahaYBY
	xZGjEueIJ00sd3Z55ezOBxPdEAMyXk8llNz67a25X4JatAAVkwKUNIlsxMqY/3pJ3U4N
	BBLnGS+JpqPrrVt5NXoonmP0uhrtUL1Q1PuXBIXsWOHzP76AMLYW5DKsCyZZXl4Ggr48
	E7ZV2zVdZe+3leCabMp/koMPyocstjb5rfowkvex9nhPEaO6wz2vTA/qjP0e1b5rL3a8
	lFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DeZ4UstUfuY6JO2Mu9NM2Sbs33OlYgqSxnmM/2vMU4A=;
	b=cSKdJACcKburP6jHN6CJrpjbb3gJ+0wOaHD96wTZ1sCntX9HWP1UxnOjrjz5dmXRy1
	0msSnOCnfeh8MRhVJoZI4ctQ0n5iObxPtiuI949SRHzemBs6IDNBCnP4gm4m8RZCpyxp
	l8HcYf1gXUj3VLRclAgD3oZULAPzsIqjbzyhiflkkpNfCwhj0OBZCi51AJ4JYJJ2u+6x
	QHQz99JDjODqhZ7plfUeaJY3ILuVMn+R/6yhbhchrQ3MjHGR1UPoNQhzTgVf3HFAzYyP
	ABkQypV7PiOwvUvfIozalO8Kl9StmEm9rpftJPbr+Z6wqFh0RSeptNFkPlSqLQ2fb/vu
	3rpA==
X-Gm-Message-State: APjAAAXLqnoJ2Kjb83+Z008YeqC40V3b5JIojA9mJdKUpagRtDKFlSbt
	+/vcjo9TPP2+0+uPDlnz8fEikbaRVREI2N8EmYU+mw==
X-Google-Smtp-Source: APXvYqxeM+Dfc1hWq9lHmEgVK5v0qnP2ZGNkyFVip6Km25NyT2aleS3PN+MNh5CMNYz+3AOhMbVogPUnDyp1bd2uHB8=
X-Received: by 2002:ac8:5347:: with SMTP id d7mr65873qto.207.1557250956659;
	Tue, 07 May 2019 10:42:36 -0700 (PDT)
MIME-Version: 1.0
From: fernando gonzalez <fgd7806@gmail.com>
Date: Tue, 7 May 2019 11:42:25 -0600
Message-ID: <CACe-08Syz7SS-B6DZ7dF6zKNzJM_9x0QSKJo1TXoYQf2w5quHQ@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Compile dts into dtbo
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2019 17:42:38 -0000
Content-Type: multipart/alternative; boundary="000000000000190ff805884fbefd"

--000000000000190ff805884fbefd
Content-Type: text/plain; charset="UTF-8"

I'm using branch "rocko" to build an image for am335x-evm machine. I need
to generate a dtbo from a custom dts using the same dtc used by Yocto
(1.4.4 in my case). I was wondering if there is a way to do this from a
custom recipe, so it is performed during "bitbake core-image-base", say
"do_compile(){dtc -O dtb -o <output.dtbo> -b 0 -@ <input.dts>}".
For now I just need to compile the file and put the dtbo in lib/firmware
folder.

--000000000000190ff805884fbefd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m using branch &quot;rocko&quot; to build an im=
age for am335x-evm machine. I need to generate a dtbo from a custom dts usi=
ng the same dtc used by Yocto (1.4.4 in my case). I was wondering if there =
is a way to do this from a custom recipe, so it is performed during &quot;b=
itbake core-image-base&quot;, say &quot;do_compile(){dtc -O dtb -o &lt;outp=
ut.dtbo&gt; -b 0 -@ &lt;input.dts&gt;}&quot;.</div><div>For now I just need=
 to compile the file and put the dtbo in lib/firmware folder.=C2=A0</div></=
div>

--000000000000190ff805884fbefd--
