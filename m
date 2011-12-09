Return-Path: <otavio.salvador@gmail.com>
Received: from mail-bw0-f53.google.com (mail-bw0-f53.google.com
	[209.85.214.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75E5FE006B5
	for <meta-ti@lists.yoctoproject.org>;
	Fri,  9 Dec 2011 04:10:12 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by bkat8 with SMTP id t8so3005704bka.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 09 Dec 2011 04:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=tQj106EfDJB+9Wy0KrkGsGlnCKsxuUUq2ylFFtOSmBE=;
	b=PVo7iwoRiPQWbIfXw0WUfPqHH0Tzf0ZdJI8G4hXKji5d3QDo2A2mdcR1NpTnRKEcjd
	xWa1SGu5g0LEh9dbdJhIg/VWMLYVbXzmiM9xW1LAtm4CYazRBF8W5LYgvlnfnVaIBjsJ
	78hVI4Ra/JWTn5SLJn4MBhGyGIPjkfuFStp8c=
MIME-Version: 1.0
Received: by 10.205.128.3 with SMTP id hc3mr507921bkc.29.1323432610655; Fri,
	09 Dec 2011 04:10:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 04:10:10 -0800 (PST)
In-Reply-To: <1323432447-6809-1-git-send-email-koen@dominion.thruhere.net>
References: <1323432447-6809-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 9 Dec 2011 10:10:10 -0200
X-Google-Sender-Auth: VeHJ1D_gHqDbXJqu32Nb0c8-Rpo
Message-ID: <CAP9ODKqT=51kG4RoE2AUMbrKHjFML2WpkAOcBmt=Ho-8TSBPCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] beaglebone-getting-started: fix LICENSE, update to latest git
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
X-List-Received-Date: Fri, 09 Dec 2011 12:10:13 -0000
Content-Type: multipart/alternative; boundary=000e0cdfc836a46d8f04b3a7aa10

--000e0cdfc836a46d8f04b3a7aa10
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 10:07, Koen Kooi <koen@dominion.thruhere.net> wrote:

> ...

-LICENSE = "GPLv2+ && MIT && PD && others"
> +LICENSE = "GPLv2+ & MIT && PD & others"

...


Missed one &&.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfc836a46d8f04b3a7aa10
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 10:07, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.t=
hruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
...=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex;">-LICENSE =3D &quot;GPLv2=
+ &amp;&amp; MIT &amp;&amp; PD &amp;&amp; others&quot;<br>
+LICENSE =3D &quot;GPLv2+ &amp; MIT &amp;&amp; PD &amp; others&quot;</block=
quote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex;">...</blockquote><div><br></div><div>M=
issed one &amp;&amp;.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfc836a46d8f04b3a7aa10--
