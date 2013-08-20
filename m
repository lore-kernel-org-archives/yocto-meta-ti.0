Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81619E01358
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 05:07:24 -0700 (PDT)
Received: by mail-oa0-f43.google.com with SMTP id i10so496023oag.30
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 05:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rjOVYfb3sKRhpzojc4OyZzZjtvvuXW03B/qHglMzuY8=;
	b=MM0pd/MWZIqVHfszhttTAC9qKEI68VSsFmVwJQb0WptRcBJ8bxsvtkZPtqVTDgvhkA
	upCSrI1XgG2TzQIZvdv4B/sGKBaCDlY6QaYBQ0t5utjde06l6J+4g5c6GG6o9tTH+xkJ
	dl0PrI7k9PcARi4IkuMGxHV9ztQjI/Uw3h5uQ/SVols5an0X0wzSF+R0Sc3MI0TPQTVu
	hGqWyU91xvVppr+zmVM/NNyeBL6MsoYmQ5Hp7xlU32iFCmRro8By7B9j4m2BEafmFDIR
	SV2h5U/OmERSVX22MD8gC5H1/nhBwazWkdLAPmMHcbb+qM3/NYsN28TP0U6I8//huu2Y
	c8mw==
X-Gm-Message-State: ALoCoQlBItMMipPI4tAEALbAc0WQ7UzgAnDac2O9yYJA8O4vZ+Ra1Z3LNumzbAGWvPgCuClEcjY/
X-Received: by 10.60.52.244 with SMTP id w20mr1159886oeo.30.1377000444438;
	Tue, 20 Aug 2013 05:07:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.172.4 with HTTP; Tue, 20 Aug 2013 05:07:04 -0700 (PDT)
In-Reply-To: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D544493F@DBDE04.ent.ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 20 Aug 2013 14:07:04 +0200
Message-ID: <CAP71WjyQN6a3C8qV3Wdaok4FmuX3Qic8c75X4t-PkXC7TnVp9Q@mail.gmail.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Timeout issue
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
X-List-Received-Date: Tue, 20 Aug 2013 12:07:25 -0000
Content-Type: multipart/alternative; boundary=001a1133460058b96304e45fe6ec

--001a1133460058b96304e45fe6ec
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2013 at 11:33 AM, Hingolikar, Mrinmayee <mrinmayee@ti.com>w=
rote:

> During yocto build many times the fetch times out resulting in a fetcher
> failure. The same command for fetch when run with a larger timeout for wg=
et
> succeeds.****
>
> Where can we modify the arguments to wget so that the build doesn=92t hal=
t
> due to a fetcher failure?****
>
> ** **
>
>
it's defined in meta/conf/bitbake.conf as:

FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp
--no-check-certificate"

you should be able to modify the value of that variable in any of your
config file.

--001a1133460058b96304e45fe6ec
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 20, 2013 at 11:33 AM, Hingolikar, Mrinmayee <span dir=3D"ltr">&=
lt;<a href=3D"mailto:mrinmayee@ti.com" target=3D"_blank">mrinmayee@ti.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><p class=3D"">During yocto build many times the fetch time=
s out resulting in a fetcher failure. The same command for fetch when run w=
ith a larger timeout for wget succeeds.<u></u><u></u></p>


<p class=3D"">Where can we modify the arguments to wget so that the build d=
oesn=92t halt due to a fetcher failure?<u></u><u></u></p>
<p class=3D""><u></u>=A0<u></u></p>
<p class=3D""></p></blockquote></div><br>it&#39;s defined in meta/conf/bitb=
ake.conf as:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">FETCHCMD_wget =3D &quot;/usr/bin/env wget -t 2 -T 30 -nv --passive-f=
tp --no-check-certificate&quot;<br>

</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">you s=
hould be able to modify the value of that variable in any of your config fi=
le.</div><div class=3D"gmail_extra"><br></div></div>

--001a1133460058b96304e45fe6ec--
