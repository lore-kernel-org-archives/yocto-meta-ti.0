Return-Path: <sudhangathan@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3147E01206
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 08:29:09 -0700 (PDT)
Received: by mail-qe0-f42.google.com with SMTP id s14so2453034qeb.15
	for <meta-ti@yoctoproject.org>; Tue, 02 Jul 2013 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:cc
	:content-type; bh=aYsbWBMkKmk4Y7a1OzvlTkEHEAEjpt/N70qzEsgRX6s=;
	b=Cn9Smd21hatZqOg2/Ah8WbK5DWBIwBSJi/YLwLFGcWTQOGDJrZvDEzlN8xM9TZ5fu9
	4EJx+zrH5mZ1FVLhrH8O8zTmV91/Uce70GL7xSHUpc6cGOkpJ55EZSVipI27GMqw7Bdy
	yFrZ+BEQEa/20uzO7UawdxRAPo0+yhfymvLn3c2GtxHhE9B5XjtuFNPCIQ2Zg77RzgyQ
	tqVuYON9VX+GPZ9OUKtXPcNnxfT5hGgDCeJ1Oinfh0HhseyllGWcF+on9zlk9l6tr45z
	a/pbzJ8Vax70BuZbwDvsOcLGirE+ff5UZrU92B4dlKolOoX3bgvRIhs8EnbX5DRtEM3/
	75iQ==
X-Received: by 10.229.38.3 with SMTP id z3mr7124644qcd.7.1372778948572; Tue,
	02 Jul 2013 08:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.95.9 with HTTP; Tue, 2 Jul 2013 08:28:48 -0700 (PDT)
In-Reply-To: <20130702142712.GD4941@edge>
References: <9c193827a41e4fe7b6d03c630beb4baa@AMSPR05MB083.eurprd05.prod.outlook.com>
	<20130702142712.GD4941@edge>
From: Sudhangathan B S <sudhangathan@gmail.com>
Date: Tue, 2 Jul 2013 20:58:48 +0530
Message-ID: <CAGX3a9_Mhe5V2hLVs5+jFcnro9YMWPtGniVAmcG=B+b6RP7gLg@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: server outage?
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
X-List-Received-Date: Tue, 02 Jul 2013 15:29:10 -0000
Content-Type: multipart/alternative; boundary=001a11c29a4a95bf5104e08901d6

--001a11c29a4a95bf5104e08901d6
Content-Type: text/plain; charset=ISO-8859-1

Frazer probably meant the arago server, which in case it does not work, we
get the error while parsing, from the boot-monitor_git.bb..

Now it seems to work.. It wasn't a while ago..!

Thanks.

---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------


On Tue, Jul 2, 2013 at 7:57 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Jul 02, 2013 at 02:08:02PM +0000, Frazer, Will wrote:
> > Hi guys,
> >       Could someone check the servers please (meta-ti etc).
> >
> > Looks like they maybe down at the moment.
>
> Seems to work for me:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/
>
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--001a11c29a4a95bf5104e08901d6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Frazer probably meant the arago server, which in case it d=
oes not work, we get the error while parsing, from the <a href=3D"http://bo=
ot-monitor_git.bb">boot-monitor_git.bb</a>..=A0<div><br></div><div style>No=
w it seems to work.. It wasn&#39;t a while ago..!</div>

<div style><br></div><div style>Thanks.</div></div><div class=3D"gmail_extr=
a"><br clear=3D"all"><div>---------------------------------<br>Sudhangathan=
 BS<br>Ph:(+91) 9731-905-205<br>---------------------------------</div>
<br><br><div class=3D"gmail_quote">On Tue, Jul 2, 2013 at 7:57 PM, Denys Dm=
ytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_=
blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

<div class=3D"im">On Tue, Jul 02, 2013 at 02:08:02PM +0000, Frazer, Will wr=
ote:<br>
&gt; Hi guys,<br>
&gt; =A0 =A0 =A0 Could someone check the servers please (meta-ti etc).<br>
&gt;<br>
&gt; Looks like they maybe down at the moment.<br>
<br>
</div>Seems to work for me:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/" target=3D"_b=
lank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br></div>

--001a11c29a4a95bf5104e08901d6--
