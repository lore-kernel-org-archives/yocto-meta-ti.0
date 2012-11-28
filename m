Return-Path: <ndec13@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 103A7E00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:38:47 -0800 (PST)
Received: by mail-qa0-f48.google.com with SMTP id s11so5909894qaa.14
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DKGsD2HnEy+cuB4mi/1H758MOS7bSHrW5di171xpSvk=;
	b=0nrl+qLAnt2AcHU8szf8lc8v75akC34h0VuohN+EyhQACmrT34T3HQ0oD9XIXysne2
	vrecmvEP2a4I1j0WIFm1tW28IADgyAfm7S7D3WVUmvSsJp8GAQv0mIxY/JxJkOC3TH94
	f3katwSboLlOyPvp8PlK6KDDkbzE4lfTGkDfS48YmZ1K25AMpfBz9k4Kcb5yJfiSyXJV
	lEzTUAMoCM71Mz9nBeu2PuaB8BJYUfAFpjITLhlvmyA6aS6jEOdgAfb/oYjKHLQjIl2s
	IN2Wy9oN4XB36xDk5tpikZN7UIwa6uNGH89TFBzE+J+WluV/fKa5yE/b9Olq06s94WfB
	O9Qg==
MIME-Version: 1.0
Received: by 10.229.205.83 with SMTP id fp19mr5139045qcb.50.1354124327518;
	Wed, 28 Nov 2012 09:38:47 -0800 (PST)
Received: by 10.49.121.161 with HTTP; Wed, 28 Nov 2012 09:38:47 -0800 (PST)
Received: by 10.49.121.161 with HTTP; Wed, 28 Nov 2012 09:38:47 -0800 (PST)
In-Reply-To: <20121128173412.GC7172@edge>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
	<CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
	<20121128173412.GC7172@edge>
Date: Wed, 28 Nov 2012 18:38:47 +0100
Message-ID: <CAOT3miJTOmCU8qar+-Vx+5UqE_tkHXrr_DOmgkxNAmC7xgahmg@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 17:38:48 -0000
Content-Type: multipart/alternative; boundary=0016e6d27bc08602a404cf91a3f9

--0016e6d27bc08602a404cf91a3f9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 28 nov. 2012 18:34, "Denys Dmytriyenko" <denys@ti.com> a =E9crit :
>
> On Wed, Nov 28, 2012 at 06:31:17PM +0100, Nicolas Dechesne wrote:
> > Le 28 nov. 2012 18:28, "Gary Thomas" <gary@mlbassoc.com> a ?crit :
> > >
> > > On 2012-11-28 10:19, Denys Dmytriyenko wrote:
> > >>
> > >> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196
> > >
> > >
> > > Bottom line: I should just use the latest Poky/Yocto tree?  I just
updated
> > > the meta-ti(master) and the quoted patches don't seem to have been
applied
> > > (the xf86-video-omap_git.bb is still present)
> > >
> >
> > Indeed you need to apply them for now. Denys should be merging them
soon.
> > But a tested-by won't hurt...
>
> They just been merged. Had a slight delay testing the master branch - too
much
> time spent dealing with denzil-based releases here from multiple teams...
:(
>

No problem. Thx. So now both poky master and danny should work on panda
with meta-ti BSP layer (master and danny branch respectively). And both
with 3.4 kernel, omapdrm driver and x11 video-omap.

> --
> Denys

--0016e6d27bc08602a404cf91a3f9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
Le 28 nov. 2012 18:34, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailto:=
denys@ti.com">denys@ti.com</a>&gt; a =E9crit=A0:<br>
&gt;<br>
&gt; On Wed, Nov 28, 2012 at 06:31:17PM +0100, Nicolas Dechesne wrote:<br>
&gt; &gt; Le 28 nov. 2012 18:28, &quot;Gary Thomas&quot; &lt;<a href=3D"mai=
lto:gary@mlbassoc.com">gary@mlbassoc.com</a>&gt; a ?crit :<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 2012-11-28 10:19, Denys Dmytriyenko wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; <a href=3D"http://thread.gmane.org/gmane.linux.embedded.=
yocto.meta-ti/1196">http://thread.gmane.org/gmane.linux.embedded.yocto.meta=
-ti/1196</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bottom line: I should just use the latest Poky/Yocto tree? =
=A0I just updated<br>
&gt; &gt; &gt; the meta-ti(master) and the quoted patches don&#39;t seem to=
 have been applied<br>
&gt; &gt; &gt; (the <a href=3D"http://xf86-video-omap_git.bb">xf86-video-om=
ap_git.bb</a> is still present)<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Indeed you need to apply them for now. Denys should be merging th=
em soon.<br>
&gt; &gt; But a tested-by won&#39;t hurt...<br>
&gt;<br>
&gt; They just been merged. Had a slight delay testing the master branch - =
too much<br>
&gt; time spent dealing with denzil-based releases here from multiple teams=
... :(<br>
&gt;</p>
<p>No problem. Thx. So now both poky master and danny should work on panda =
with meta-ti BSP layer (master and danny branch respectively). And both wit=
h 3.4 kernel, omapdrm driver and x11 video-omap.<br></p>
<p>&gt; --<br>
&gt; Denys<br>
</p>

--0016e6d27bc08602a404cf91a3f9--
