Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27C21E01447;
	Wed, 21 Nov 2012 15:26:33 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id l22so6965765vbn.35
	for <multiple recipients>; Wed, 21 Nov 2012 15:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OtNq4ZGXN4iKg+8z+j4/RMLIHq4k2USe21KRkVa0bFI=;
	b=Mj4nykNg5GDQZkhectv9VS5JQddgJDJ4YOliDAxHyyz1dmbAz3LPTF9+XjK6fF79x5
	KoHpq6K1UWGm/4Vb7oAHW6uVITfaioh1LMsJdJBDUo25hHmcM9RpBcEwFuhEE7MB08bc
	GEus5T57bHvW4GB6DiyRaTj0wU+eBCvl6fl+yKpeLRO4ZM4GnhxjrZ4LVVlYulAWBl3V
	qCB8J1uPSxOXb21SRU4OotJ7UzIUj4svPVM7pdo5m+t7jhw+fEI36YqjOizxrlL+X36C
	RnBS/bWIutz5WvNBHb8rYezPenp1NFAYS4ngfEgcz/sQhtno6m3qT3/ou8p3CI5ItC+y
	wCSQ==
Received: by 10.52.177.104 with SMTP id cp8mr27172705vdc.47.1353540393318;
	Wed, 21 Nov 2012 15:26:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Wed, 21 Nov 2012 15:26:12 -0800 (PST)
In-Reply-To: <CAJTo0LYLf=296eEZznK7vnFTJZhAS_u1opuXdyJ=MUvRYF1Asw@mail.gmail.com>
References: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
	<CAJTo0LYLf=296eEZznK7vnFTJZhAS_u1opuXdyJ=MUvRYF1Asw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 22 Nov 2012 00:26:12 +0100
Message-ID: <CAOT3miJf7yh=1c-xxfZ-sxZt4RUvufcgVTMv0Dzw=kSbz5wXaA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, rob@ti.com
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 23:26:34 -0000
Content-Type: multipart/alternative; boundary=20cf3071c8125539b804cf09ae2e

--20cf3071c8125539b804cf09ae2e
Content-Type: text/plain; charset=ISO-8859-1

looping rob clark (upstream author)


On Thu, Nov 22, 2012 at 12:07 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 21 November 2012 22:52, Nicolas Dechesne <ndec13@gmail.com> wrote:
> > since xf86-video-omap was recently merged in oe-core and poky, i am
> trying
> > to remove the recipes we had staged in meta-ti trees for some weeks
> > (
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=410dc026f2ee24a2346e7563a83f0181c79809cf
> ).
> > so i was trying to build  poky/master with meta-ti/master, for
> pandaboard,
> > and I get build failures in xf86-video-omap [1] and [2].
> >
> > so [1] is actually trivial, as we are missing a DEPENDS in the recipe, i
> can
> > send a patch in oe-core for that.
>
> Please do.
>

sure, will do.

>
> > [2] is a bit more cryptic to me.. so I quickly tried to build with danny
> ( i
> > just cherry picked the commit that introduced xf86-video-omap from
> master)
> > and this time it built fine.
> >
> > has anyone actually tested this recipe? if so I must be doing something
> > wrong, any hint would be helpful.
>
> This was discussed a few hours ago.  It's caused by a) the
> configure.ac being broken and b) the workaround for this being removed
> by me in e828faf027540bc5def8b7371a959884caad9557 (which is in master
> only).  Presumably this code was test built before that patch landed.
>
> As this is a genuine upstream bug (ARM-specific driver that doesn't
> cross-compile?!) I've just filed fdo #57386.
>

i suspect you opened a OE bug, since I can't find it in yocto BZ, however
bugs.openembedded.org doesn't seem to answer at the moment..

so, I checked our configure.ac , and clearly, that needs some love...

Rob: any chance you can look into that? it's the xf86-video-omap
configure.ac file that's wrong, we should mimic what's in the
xf-video-intel one i guess..  otherwise i can try later this week.




> Ross
>

--20cf3071c8125539b804cf09ae2e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

looping rob clark (upstream author)<div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">On Thu, Nov 22, 2012 at 12:07 AM, Burton, Ross <span =
dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">=
ross.burton@intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 21 November 2012 22:52,=
 Nicolas Dechesne &lt;<a href=3D"mailto:ndec13@gmail.com">ndec13@gmail.com<=
/a>&gt; wrote:<br>


&gt; since xf86-video-omap was recently merged in oe-core and poky, i am tr=
ying<br>
&gt; to remove the recipes we had staged in meta-ti trees for some weeks<br=
>
&gt; (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?=
id=3D410dc026f2ee24a2346e7563a83f0181c79809cf" target=3D"_blank">http://git=
.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3D410dc026f2ee24a2346e75=
63a83f0181c79809cf</a>).<br>


&gt; so i was trying to build =A0poky/master with meta-ti/master, for panda=
board,<br>
&gt; and I get build failures in xf86-video-omap [1] and [2].<br>
&gt;<br>
&gt; so [1] is actually trivial, as we are missing a DEPENDS in the recipe,=
 i can<br>
&gt; send a patch in oe-core for that.<br>
<br>
</div>Please do.<br></blockquote><div><br></div><div>sure, will do. =A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; [2] is a bit more cryptic to me.. so I quickly tried to build with dan=
ny ( i<br>
&gt; just cherry picked the commit that introduced xf86-video-omap from mas=
ter)<br>
&gt; and this time it built fine.<br>
&gt;<br>
&gt; has anyone actually tested this recipe? if so I must be doing somethin=
g<br>
&gt; wrong, any hint would be helpful.<br>
<br>
</div>This was discussed a few hours ago. =A0It&#39;s caused by a) the<br>
<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a> being br=
oken and b) the workaround for this being removed<br>
by me in e828faf027540bc5def8b7371a959884caad9557 (which is in master<br>
only). =A0Presumably this code was test built before that patch landed.<br>
<br>
As this is a genuine upstream bug (ARM-specific driver that doesn&#39;t<br>
cross-compile?!) I&#39;ve just filed fdo #57386.<br></blockquote><div><br><=
/div><div>i suspect you opened a OE bug, since I can&#39;t find it in yocto=
 BZ, however <a href=3D"http://bugs.openembedded.org">bugs.openembedded.org=
</a> doesn&#39;t seem to answer at the moment..=A0</div>

<div><br></div><div>so, I checked our <a href=3D"http://configure.ac">confi=
gure.ac</a> , and clearly, that needs some love...=A0</div><div><br></div><=
div>Rob: any chance you can look into that? it&#39;s the xf86-video-omap <a=
 href=3D"http://configure.ac">configure.ac</a> file that&#39;s wrong, we sh=
ould mimic what&#39;s in the xf-video-intel one i guess.. =A0otherwise i ca=
n try later this week.</div>

<div><br></div><div><br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--20cf3071c8125539b804cf09ae2e--
