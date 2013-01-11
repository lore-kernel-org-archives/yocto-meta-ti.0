Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E752AE006D2
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 07:50:33 -0800 (PST)
Received: by mail-lb0-f181.google.com with SMTP id ge1so1389540lbb.26
	for <meta-ti@yoctoproject.org>; Fri, 11 Jan 2013 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=NCmuF9yE03ACWLfMobqUJLSjyW5FKpjbCEYL+6kZNwM=;
	b=NbXlpxbaMtJY3bL9EFuoEI5lfrbwOTAz05W7xJoC5ab4XkhJrYBmu2LYLVIXKyUpj7
	P5/KY2Xasmp05XidpkPKGjw2HzyfKORi5bZk4Ykw7sNcRUHlTdbzGZA+ul9gpSFBlPOR
	/nnkZIDKa226Ggat7onhwxZC+leK4sBZnao8WtHzVkvWs9kl8/JnTXegV8VMxvgTqytY
	WPpoEI1b4yiPcws+hRQTLI+P0e0aGPanqpPjsN7vU9GekAYoPolHNhnM8UV5NPdD2Vc/
	54LpTrTSF0JL2Nmbu3kzzNneCZy+tzmVcaozSM5WAke+tKOkZFV7OsLQBg/3YBE2Jimp
	pu8A==
Received: by 10.152.144.103 with SMTP id sl7mr24204595lab.23.1357919432627;
	Fri, 11 Jan 2013 07:50:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Fri, 11 Jan 2013 07:50:12 -0800 (PST)
In-Reply-To: <CAHUNapTODZveoW70_tdODtLyc-fiEvwkZQXTd0tQfxQUqvF9-w@mail.gmail.com>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
	<CAHUNapTODZveoW70_tdODtLyc-fiEvwkZQXTd0tQfxQUqvF9-w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Jan 2013 08:50:12 -0700
X-Google-Sender-Auth: dtCDalYaYasfQWiea-lrEKy2Yf4
Message-ID: <CABcZANnOJYe58Np5pmELOb6fFQfeLoc3uRcEreHkP0zXnjzpzA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Fri, 11 Jan 2013 15:50:34 -0000
Content-Type: multipart/alternative; boundary=e89a8f22bec16a55f204d3054125

--e89a8f22bec16a55f204d3054125
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 10, 2013 at 3:50 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Thu, Jan 10, 2013 at 10:07 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> > Interestingly enough, the meta-fsl-arm layer also has an SD card image
> > layout (class) which works perfectly and needs no magic to make it work.
>
>
> Very interesting! Thanks so much for posting this information.
>
> The meta-ti method uses a combination of losetup, sfdisk, dd, and
> others to create its images (which is what I have traditionally used
> to create my own images). losetup (for sure and probably sfdisk too)
> requires privilege in order to work (which probably accounts for all
> the messy setup).
>
> The meta-fsl-arm method, on the other hand, uses GNU parted which
> doesn't appear to require privilege and does away with losetup and
> sfdisk.
>
> I'm glad you posted this information as I'll now be converting my
> scripts to use parted as well.


We started looking at a parted based pandaboard sdcard image creation setup
for Mentor, but haven't completed it, so we'd be interested in seeing what
people do in this regard. Obviously it'll all probably go away in favor of
the image creation/deployment rework in the long term, but we need
something in the short term.

One issue we ran into is, my panda seems to require a particular alignment
(e.g. first partition at 63*255) based on geometry, but parted's alignment
options are rather limited. Either one can use pyparted (but that's GPL,
and the metadata is MIT), or use sfdisk (which has its own issues, but lets
you specify geometry), or manually calculate the alignment (theoretical).
-- 
Christopher Larson

--e89a8f22bec16a55f204d3054125
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 10, 2013 at 3:50 PM, Trevor Woerner <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&g=
t;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, Jan 10, 2013 at 10=
:07 AM, Gary Thomas &lt;<a href=3D"mailto:gary@mlbassoc.com">gary@mlbassoc.=
com</a>&gt; wrote:<br>


&gt; Interestingly enough, the <span class=3D"il">meta</span>-fsl-arm layer=
 also has an SD card image<br>
&gt; layout (class) which works perfectly and needs no magic to make it wor=
k.<br>
<br>
<br>
</div>Very interesting! Thanks so much for posting this information.<br>
<br>
The <span class=3D"il">meta</span>-<span class=3D"il">ti</span> method uses=
 a combination of losetup, sfdisk, dd, and<br>
others to create its images (which is what I have traditionally used<br>
to create my own images). losetup (for sure and probably sfdisk too)<br>
requires privilege in order to work (which probably accounts for all<br>
the messy setup).<br>
<br>
The <span class=3D"il">meta</span>-fsl-arm method, on the other hand, uses =
GNU parted which<br>
doesn&#39;t appear to require privilege and does away with losetup and<br>
sfdisk.<br>
<br>
I&#39;m glad you posted this information as I&#39;ll now be converting my<b=
r>
scripts to use parted as well.</blockquote></div><br>We started looking at =
a parted based pandaboard sdcard image creation setup for Mentor, but haven=
&#39;t completed it, so we&#39;d be interested in seeing what people do in =
this regard. Obviously it&#39;ll all probably go away in favor of the image=
 creation/deployment rework in the long term, but we need something in the =
short term.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">One issue w=
e ran into is, my panda seems to require a particular alignment (e.g. first=
 partition at 63*255) based on geometry, but parted&#39;s alignment options=
 are rather limited. Either one can use pyparted (but that&#39;s GPL, and t=
he metadata is MIT), or use sfdisk (which has its own issues, but lets you =
specify geometry), or manually calculate the alignment (theoretical).<br>

-- <br>Christopher Larson</div></div>

--e89a8f22bec16a55f204d3054125--
