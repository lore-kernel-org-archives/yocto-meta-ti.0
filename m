Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B2A7E007AD; Tue, 12 Aug 2014 05:30:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_IMAGE_ONLY_32,
	HTML_MESSAGE, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* 0.0 HTML_IMAGE_ONLY_32 BODY: HTML: images with 2800-3200 bytes of
	words
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCADBE00796
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 05:30:42 -0700 (PDT)
Received: by mail-qg0-f54.google.com with SMTP id z60so9707280qgd.27
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UeE4NdO2n7zmzWfk3JV+REHbT1JNzXEbPbdERZjxCtY=;
	b=VvZX1c7UoreJ2mNbInSve7gA9ZlfZh2onfAnBQVZla5YFJv01U32M7xAc0iH0lIgkY
	XKbdm168RhzL9G/a7B+meHcKqDFtHIg3it+m7JOVeYOUN1wbMzU9lSNC+TNL+vhzUw5t
	hyfLDd1cRijZv2kCZSNCCyOU+m0/nHp3UHhbw0oM+MR5u+a2QrqBYQ+uJmD+8bRMnHU2
	JTrK7sAilvY5ffXAqOwXNxGKpUC9WCF9VkyLblJE4i4lrtenzkDUDP5797X3SQZzewiz
	W9u2XuPd/KAVEERCgcUambA9hQ/+qB+oqDfkOZgsWdqAgH7Z+mdMnJ/aTeeU6npEcSTO
	ryGg==
X-Received: by 10.224.130.7 with SMTP id q7mr6196213qas.42.1407846642276; Tue,
	12 Aug 2014 05:30:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Tue, 12 Aug 2014 05:30:22 -0700 (PDT)
In-Reply-To: <20140812020344.BF28052981@arago-project.org>
References: <20140812020344.BF28052981@arago-project.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 12 Aug 2014 09:30:22 -0300
Message-ID: <CAMCfZKFhAVNKZP2X5jATWOWwrtk4TdBK5VADsui+dTWACAHr9g@mail.gmail.com>
To: Arago Project git <git@arago-project.org>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Tue, 12 Aug 2014 12:30:50 -0000
Content-Type: multipart/alternative; boundary=001a11c2cb1002e1c705006dd7ea

--001a11c2cb1002e1c705006dd7ea
Content-Type: text/plain; charset=ISO-8859-1

Hi there,


On Mon, Aug 11, 2014 at 11:03 PM, Arago Project git <git@arago-project.org>
wrote:

> Module: meta-ti
> Branch: daisy
> Commit: 7eeebc0f79d9097e771855d4cfefdb6989be3d05
> URL:
> http://arago-project.org/git/meta-ti.git?a=commit;h=7eeebc0f79d9097e771855d4cfefdb6989be3d05
>
>
> Author: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Date:   Mon Aug  4 21:45:50 2014 +0000
>
> beaglebone: use the am335x_boneblack u-boot configuration
>
> Using the am335x_boneblack configuration for u-boot allows to save the
> environment to the emmc. Else, it is not possible to save the
> environment at all.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>  conf/machine/beaglebone.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 8a83a1a..0b4dce3 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
>
>  SERIAL_CONSOLE = "115200 ttyO0"
>
> -UBOOT_MACHINE = "am335x_evm_config"
> +UBOOT_MACHINE = "am335x_boneblack"
>

There is a typo here. Must be "am335x_boneblack_config" instead of
"am335x_boneblack"


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c2cb1002e1c705006dd7ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi there,</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 11, 2014 at 11:03 PM, Arago Project git <span dir=3D"ltr">&=
lt;<a href=3D"mailto:git@arago-project.org" target=3D"_blank">git@arago-pro=
ject.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":1ee" class=3D"" style=3D"overflow:hidden">Modu=
le: meta-ti<br>


Branch: daisy<br>
Commit: 7eeebc0f79d9097e771855d4cfefdb6989be3d05<br>
URL: =A0 =A0<a href=3D"http://arago-project.org/git/meta-ti.git?a=3Dcommit;=
h=3D7eeebc0f79d9097e771855d4cfefdb6989be3d05" target=3D"_blank">http://arag=
o-project.org/git/meta-ti.git?a=3Dcommit;h=3D7eeebc0f79d9097e771855d4cfefdb=
6989be3d05</a><div class=3D"">

<div id=3D":1f3" class=3D"" tabindex=3D"0"><img class=3D"" src=3D"//ssl.gst=
atic.com/ui/v1/icons/mail/images/cleardot.gif"></div></div><div class=3D"">=
<br>
</div><div class=3D""><div class=3D""><br>
Author: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@free-elec=
trons.com">alexandre.belloni@free-electrons.com</a>&gt;<br>
Date: =A0 Mon Aug =A04 21:45:50 2014 +0000<br>
<br>
beaglebone: use the am335x_boneblack u-boot configuration<br>
<br>
Using the am335x_boneblack configuration for u-boot allows to save the<br>
environment to the emmc. Else, it is not possible to save the<br>
environment at all.<br>
<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@fr=
ee-electrons.com">alexandre.belloni@free-electrons.com</a>&gt;<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@=
ti.com</a>&gt;<br>
<br>
---<br>
<br>
=A0conf/machine/beaglebone.conf | =A0 =A02 +-<br>
=A01 files changed, 1 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf<br=
>
index 8a83a1a..0b4dce3 100644<br>
--- a/conf/machine/beaglebone.conf<br>
+++ b/conf/machine/beaglebone.conf<br>
@@ -11,4 +11,4 @@ IMAGE_FSTYPES +=3D &quot;tar.gz&quot;<br>
<br>
=A0SERIAL_CONSOLE =3D &quot;115200 ttyO0&quot;<br>
<br>
-UBOOT_MACHINE =3D &quot;am335x_evm_config&quot;<br>
+UBOOT_MACHINE =3D &quot;am335x_boneblack&quot;<br></div></div></div></bloc=
kquote></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">There is a typo here. Must be &quot;am335x_boneblack_config&quot; instead=
 of &quot;am335x_boneblack&quot;</div>

<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></d=
iv>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=
=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_med=
ium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blan=
k">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c2cb1002e1c705006dd7ea--
