Return-Path: <kergoth@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32020E004E5; Tue, 20 Dec 2016 09:54:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.53 listed in list.dnswl.org]
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E12ECE0034A
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 09:54:33 -0800 (PST)
Received: by mail-oi0-f53.google.com with SMTP id b126so185665397oia.2
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2016 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ONHRWON/8LJy5q51XuCTE9Sv0Ud609Tuz/OXk2P/NoA=;
	b=LwBbJPRIE3Vtn6DdKG6bxtEqFbiJGp6S8Td99hpN7wzyqJTSZNk13lRhsZEfoyyrkg
	DvR28NP80pzem2oGpKb6njZZNcUNji13J+5rxnSjAKPjfO1BHyIlrjHXsdEpjls1zrxf
	ZZgd/bKcF+JR+5EN3Fuh0VC+BvSy1UXt/hojdrE+ovV80tGG7VPw+n26UMnSffg7qzCp
	1mbXP7yHWiw2eJO0u4X63Gs1x2FNaEMuDAYoUaLOIAAqehOIgograeBIgrCmn9wf8PwB
	ZYpZWD+jSs0F1kJogcdcFnBdw55qgLm9nsd1vWiB0U4VwEvYAowHtuJjObj4LAoah+M0
	O0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ONHRWON/8LJy5q51XuCTE9Sv0Ud609Tuz/OXk2P/NoA=;
	b=AkMknLMx3W4y4vlTqaRmt6TiuZygjIYJCmPafJ/Ns4hP3QB9JCL1Ki+fdpXqNPQUw4
	4qvqLNwUWq9xkN7j6D3DnATlhjW5Puitp2z51uXzxQ8q4VjQBiZsr9ifJKthViaORkTU
	6kDSng1NBMIug7KsVSkmbYXgLKFKYipK27GUefqK09L2rkqObczNdJpsNVrB5ej+lXyL
	zPOLUsnXRC4gAiDNfhbVxj2HEsTrwk4m++2UF2vr0gWHGG/PD7PKrulYcrzMEgQ3htep
	JWLZrIJoJY0NDCZ2S3NMAh0hTIMj+VxF1itCDPW4xXlxFHYqxRtK6ODC09TpbgCutpCi
	znqw==
X-Gm-Message-State: AIkVDXJt/NH9Icd2ycq+F/5XtRG5QQ7PMj9BnuruOyqa+aUcpUuHzDmG2X+evfkRnb6uPYf9Ar3CRMAfj2f/hw==
X-Received: by 10.202.228.139 with SMTP id b133mr291786oih.111.1482256472544; 
	Tue, 20 Dec 2016 09:54:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Tue, 20 Dec 2016 09:54:12 -0800 (PST)
In-Reply-To: <1482250466-32489-1-git-send-email-j-stiffler@ti.com>
References: <1482250466-32489-1-git-send-email-j-stiffler@ti.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 20 Dec 2016 10:54:12 -0700
X-Google-Sender-Auth: 8QOgk-JfRzqrbH1J1ouO87s7ki0
Message-ID: <CABcZAN=hyfYC8SqiwSzX_8pUe-o7kDxCgWobCUBMrP0mV0E2sg@mail.gmail.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] pruss-lld: set CLEANBROKEN
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
X-List-Received-Date: Tue, 20 Dec 2016 17:54:37 -0000
Content-Type: multipart/alternative; boundary=001a114039d2831b3605441aba30

--001a114039d2831b3605441aba30
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 9:14 AM, Jacob Stiffler <j-stiffler@ti.com> wrote:

> * The Linux binaries are built by the "makefile_armv7".
> * pruss-lld provides a "makefile", but it is used for building the
>   RTOS binaries.
> * This "makefile" requires the ti-pdk-build-rtos package and is broken
>   without it, so therefore set CLEANBROKEN instead of pulling in
>   unnecessary dependencies.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>

Could you not just make sure the -f is passed to the clean?

EXTRA_OEMAKE +=3D "-f makefile_armv7 PDK_INSTALL_PATH=3D${STAGING_INCDIR}=
=E2=80=9D
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114039d2831b3605441aba30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 20, 2016 at 9:14 AM, Jacob Stiffler <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:j-stiffler@ti.com" target=3D"_blank">j-stiffler@ti.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D"gmail-:1mm" class=3D"gmail-a3=
s gmail-aXjCH gmail-m1591d0d514f9e25d">* The Linux binaries are built by th=
e &quot;makefile_armv7&quot;.<br>
* pruss-lld provides a &quot;makefile&quot;, but it is used for building th=
e<br>
=C2=A0 RTOS binaries.<br>
* This &quot;makefile&quot; requires the ti-pdk-build-rtos package and is b=
roken<br>
=C2=A0 without it, so therefore set CLEANBROKEN instead of pulling in<br>
=C2=A0 unnecessary dependencies.<br>
<br>
Signed-off-by: Jacob Stiffler &lt;<a href=3D"mailto:j-stiffler@ti.com">j-st=
iffler@ti.com</a>&gt;</div></blockquote></div><br>Could you not just make s=
ure the -f is passed to the clean?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">EXTRA_OEMAKE +=3D &quot;-f makefile_armv7 PDK_=
INSTALL_PATH=3D${STAGING_INCDIR}=E2=80=9D</div><div class=3D"gmail_extra">-=
- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergo=
th dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Softwar=
e Engineer, Mentor Graphics</div>
</div></div>

--001a114039d2831b3605441aba30--
