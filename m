Return-Path: <otavio.salvador@gmail.com>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D52AE00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:53:21 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by bkbc12 with SMTP id c12so12180953bkb.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=y08S/9hcNDOBGbzOO97w2fz9I8+bhkPK7sQI1BdJ4PA=;
	b=vF98Jsn/iXOLlhsG3m/nanluCkV777ZPBUu5eKHM6sEpnut/K6To7k4a5/CH4fHsSo
	RW7DPPY6b6XmM3WZMdBLTTOajildYi6XamSX3Z96vQbrn4hHD1RBTmkQhWsdd0K7qmfp
	jXDVndWiO88lLUfpJLDka3oglGLdfHROriYLA=
MIME-Version: 1.0
Received: by 10.205.126.13 with SMTP id gu13mr50370649bkc.114.1322571199733;
	Tue, 29 Nov 2011 04:53:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Tue, 29 Nov 2011 04:53:19 -0800 (PST)
In-Reply-To: <ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
Date: Tue, 29 Nov 2011 10:53:19 -0200
X-Google-Sender-Auth: QN-3KAOE12AIpxQxrmryOs-FkjU
Message-ID: <CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Tue, 29 Nov 2011 12:53:21 -0000
Content-Type: multipart/alternative; boundary=00151747b7448ce1fc04b2df1aa8

--00151747b7448ce1fc04b2df1aa8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 29, 2011 at 10:41, Otavio Salvador <otavio@ossystems.com.br>wrote:

> ...

+# Copyright (C) 2011 O.S. Systems Software LTDA.
> +#
> +# Create an image that can by written onto a SD card using dd.
> +#
> +# External variables needed:
> +#   ${ROOTFS} - the rootfs image to incorporate
>

I added Joel in copyright noticed as he did the first version of it. You
can look at
https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398ea12d660b3



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--00151747b7448ce1fc04b2df1aa8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Nov 29, 2011 at 10:41, Otavio Salvador <=
span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossy=
stems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
...=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex;">+# Copyright (C) 2011 O.=
S. Systems Software LTDA.<br>
+#<br>
+# Create an image that can by written onto a SD card using dd.<br>
+#<br>
+# External variables needed:<br>
+# =A0 ${ROOTFS} - the rootfs image to incorporate<br></blockquote><div><br=
></div><div>I added Joel in copyright noticed as he did the first version o=
f it. You can look at=A0<a href=3D"https://github.com/OSSystems/meta-ti/com=
mit/cc8f9eeb2e73c77cdb24f8d8eb2398ea12d660b3">https://github.com/OSSystems/=
meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398ea12d660b3</a>=A0</div>
</div><br clear=3D"all"><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">http=
://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--00151747b7448ce1fc04b2df1aa8--
