Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E251E0159B
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 13:31:40 -0700 (PDT)
Received: by mail-ea0-f171.google.com with SMTP id n15so685614ead.16
	for <meta-ti@yoctoproject.org>; Wed, 09 Oct 2013 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4g6NWBZvfE25U+pJoD06/bUZoFfOjG51sHbdJEtnN6E=;
	b=oCiXB96ufBBP8xwRhjwsdLX6iQE1e1XnLP1B0dfbTkQMQNHmfhAnd2qEkDYP4KMgBp
	5P3yYn8AoHX4SbFHtfd1WdwpVGoQcPB8oaVLibmAr2jPmerMVLnUf/IT2JaoyGgh/Tkl
	A2oGwK47icWEBnUKtds1wl30eNsE+gUaGywV0L+Fr2/T8t+u1tG+Y3msZ5vH+H8giiv7
	XUnUbICRR890GxEUxgsZ7HjBDYpc+zOolXVjBsfhzecTyo2+ObgVF2F1HrAJd12ukhR3
	qQrRN6VN9DBMZ6KZ8ZYMVWO+5Fu5OPuMrakeOCHzED17o2FUUj67nIXWdnELKlG5BwW8
	/ycg==
MIME-Version: 1.0
X-Received: by 10.14.184.132 with SMTP id s4mr14417042eem.13.1381350699661;
	Wed, 09 Oct 2013 13:31:39 -0700 (PDT)
Received: by 10.223.144.205 with HTTP; Wed, 9 Oct 2013 13:31:39 -0700 (PDT)
In-Reply-To: <CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
	<20131009180902.GB15357@edge>
	<CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
Date: Wed, 9 Oct 2013 16:31:39 -0400
Message-ID: <CAFZh4h9sHFnN5LGojbiUaPrY++=_AMwGfOZ2rLTosHL2XT4pew@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Wed, 09 Oct 2013 20:31:41 -0000
Content-Type: multipart/alternative; boundary=047d7b3438f6c37fd604e854c5e0

--047d7b3438f6c37fd604e854c5e0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 9, 2013 at 3:15 PM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

> ...  The other problem I saw was in OECore, I added the linux-libc-headers
> for 2.6.37.2 so packages would be built with headers that matched my TI PSP
> based kernel and I was able to get that to work.  In Poky, I made the same
> mods to try and build everything against 2.6.37.2 headers and no matter
> what I tried it would always use 3.10 headers.  Probably OK but I still
> worry it could cause a problem.
>
>
I retract the statement I made earlier regarding not being able to use
2.6.37.2 libc-headers in Poky.  Looks like I didn't have the recipe setup
quite right.  I studied the differences some more between how OECore and
Poky are set up and made more mods to the recipes and now it looks like it
is fetching and attempting to use the version I asked for (doing a
beaglebone build instead of c6a816x-evm build this time).

Regards,

Brian

--047d7b3438f6c37fd604e854c5e0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Oct 9, 2013 at 3:15 PM, Brian Hutchinson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:b.hutchman@gmail.com" target=3D"_blank">b.hutchman@gmail.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"gmail_quote">...=A0 The other problem I saw was in OECore, I =
added the linux-libc-headers for 2.6.37.2 so packages would be built with h=
eaders that matched my TI PSP based kernel and I was able to get that to wo=
rk.=A0 In Poky, I made the same mods to try and build everything against 2.=
6.37.2 headers and no matter what I tried it would always use 3.10 headers.=
=A0 Probably OK but I still worry it could cause a problem.</div>
</div><br></div></blockquote><div><br></div><div>I retract the statement I =
made earlier regarding not being able to use 2.6.37.2 libc-headers in Poky.=
=A0 Looks like I didn&#39;t have the recipe setup quite right.=A0 I studied=
 the differences some more between how OECore and Poky are set up and made =
more mods to the recipes and now it looks like it is fetching and attemptin=
g to use the version I asked for (doing a beaglebone build instead of c6a81=
6x-evm build this time).<br>
<br></div><div>Regards,<br><br></div><div>Brian <br></div></div><br></div><=
/div>

--047d7b3438f6c37fd604e854c5e0--
