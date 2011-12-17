Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB6A8E0070D
	for <meta-ti@yoctoproject.org>; Sat, 17 Dec 2011 08:11:46 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eaac13 with SMTP id c13so5289723eaa.35
	for <meta-ti@yoctoproject.org>; Sat, 17 Dec 2011 08:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=w+M4AV48V7gt7Pq3yumxJfYgTcffPEOND36ux1bOkwU=;
	b=qb7vJJjLPGp1ORcC+6HO/yFmZUt/tjA6owhAEB31tTrZ6YhZpe0uKlFFwpncqIWFV3
	ccQh7ypjchkBp9+QcO5j7FtTzBdIqpW+fjv2gFFj1AGJHum3h4j70IsjIWTRZf9qH+WK
	8cOtTo2ZOEjPu+jAj+WJhigzvueYH6Vy/JQ7Q=
MIME-Version: 1.0
Received: by 10.205.122.68 with SMTP id gf4mr3715012bkc.5.1324138304050; Sat,
	17 Dec 2011 08:11:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Sat, 17 Dec 2011 08:11:44 -0800 (PST)
In-Reply-To: <cover.1323961434.git.otavio@ossystems.com.br>
References: <cover.1323961434.git.otavio@ossystems.com.br>
Date: Sat, 17 Dec 2011 14:11:44 -0200
X-Google-Sender-Auth: Hpdw8BhUJNkL9QUThvFIeXVNNKY
Message-ID: <CAP9ODKqADK3jzDncQQ65tr8pOnrehWHvrYPKkMn8O+qgaxekxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Subject: Re: [PATCH v3 0/3] Rewrite sdcard_image.bbclass
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
X-List-Received-Date: Sat, 17 Dec 2011 16:11:47 -0000
Content-Type: multipart/alternative; boundary=000e0cdf71243f17d304b44bf9e3

--000e0cdf71243f17d304b44bf9e3
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 13:05, Otavio Salvador <otavio@ossystems.com.br>wrote:

> The required fix for dosfstools to work has been merged on OE-Core and
> this allows this changes to be tested and merged now.
>

I am converting those to use mtools and avoid the dosfstools -d usage.

Please hold the merging until I do that.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdf71243f17d304b44bf9e3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 15, 2011 at 13:05, Otavio Salvador <=
span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossy=
stems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
The required fix for dosfstools to work has been merged on OE-Core and<br>
this allows this changes to be tested and merged now.<br></blockquote><div>=
<br></div><div>I am converting those to use mtools and avoid the dosfstools=
 -d usage.</div><div><br></div><div>Please hold the merging until I do that=
.</div>
<div><br></div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdf71243f17d304b44bf9e3--
