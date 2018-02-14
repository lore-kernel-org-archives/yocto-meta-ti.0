Return-Path: <adam.yh.lee@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CC42E00E21; Wed, 14 Feb 2018 06:43:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (adam.yh.lee[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46821E007E1
	for <meta-ti@yoctoproject.org>; Wed, 14 Feb 2018 06:43:45 -0800 (PST)
Received: by mail-yw0-f180.google.com with SMTP id d77so2766878ywb.2
	for <meta-ti@yoctoproject.org>; Wed, 14 Feb 2018 06:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yoGDpcjQ4vS8BtP6iK2jY6ItxriER83BTTcLpIT7vDA=;
	b=ZECwLqIqE3VWIrwkreuhB+9J56qsno+tfptl7uVjm8Wo1s3rwTxzU+Z2DhjcDLYpIm
	Xz6PHXG9ZojNsuSH/u/qgg8RGSbVWBDeze9fpxITkHtA/KIaDhC7zDCMf/QvULzIc4Zu
	aZ03aqisCTIX3ETjZcVYx6tLxKPsvU9YOIeu0yvtlBxviA82yhMlTLykyiLYa8vchZq5
	56D268KuC4QyKmWq/cHEiir4ZwNp/oWzVlZFgNfMrN1zQFCsvc2Z+egGjpuaUDJs1E0H
	bKBcs8AGkdNMFn4vAmhzYtdbUC2Sy5a6kxymPfQugwFL0A5cqSa0zQbBd45xJAW57vO9
	s62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yoGDpcjQ4vS8BtP6iK2jY6ItxriER83BTTcLpIT7vDA=;
	b=qTZLJi51lHBntuNGxXrOteQWZkPcrPjgzHHtM0NuVl8Ru+WDRIymnq2iQ+sMXKiLai
	QiwYs1BNiWUpAdCcpso9yhZ/v7NUCimZOgC23n7K+H+5kQ+d+/yOSYCZpf0Gs5s/kX6L
	6hWAyixx84hT3o99pSOc6t6aVs+8L4FvhRZDCAIHh7lJfpzhydWdWfMQyA95sN9zu75q
	Nhont6j+T+1MZXLervOpAjj79midiDtZQw9X7h/TYw4lpIEXwdcks4s7JggNOlaf0ghP
	J1XJZZgNLju3902NIIoBir1Ls92NKgcNIXxdF0vYqI3QlH9GjIMoVkYMHQdPeLA6AF9A
	Z4Sw==
X-Gm-Message-State: APf1xPCrPKKuQ2jNojg0D/HbN9f0d+R2QPkHnTbiXZ8XkawwRTSgtPDu
	KYMSiCFTkcQ/1haJvLMmM2HeY+SPE2m6tI81HOo=
X-Google-Smtp-Source: AH8x226K5L0B6VjHW4UISFTOB48Mma77A0ldttEJ235F1JF+B2YGlcOXHZfpoUhpotNb6wUWMWHrovjjQ26RZTV6cWo=
X-Received: by 10.37.126.197 with SMTP id z188mr1974130ybc.496.1518619424373; 
	Wed, 14 Feb 2018 06:43:44 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL7N1D8KQxdz2AqhDHbcww8+8x8ouMKRw4rK5ubf7Z63Uw@mail.gmail.com>
	<CAFeBWL5wNMRYoK1wW3nL3xo10ySpJbdYXmPjr0fnVBctyR7Lyw@mail.gmail.com>
	<20180212180656.GF31854@edge>
In-Reply-To: <20180212180656.GF31854@edge>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 14 Feb 2018 14:43:33 +0000
Message-ID: <CAFeBWL5kGF037g6TmNro0tUvqB6vZS7OvkTn-CniYKs2ovrWGQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Weston Desktop Shell
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
X-List-Received-Date: Wed, 14 Feb 2018 14:43:46 -0000
Content-Type: multipart/alternative; boundary="001a114bce0456c1a705652d23c5"

--001a114bce0456c1a705652d23c5
Content-Type: text/plain; charset="UTF-8"

Great, Eric's patch worked. Although I couldn't apply them directly, it was
easy enough to patch manually.

I will further direct my issues to meta-arago.

BR,

Adam

On Mon, Feb 12, 2018 at 1:06 PM Denys Dmytriyenko <denys@ti.com> wrote:

> Adam,
>
> We just switched from Morty to Rocko as our LTS branch couple months ago
> and
> some features are still missing, while teams are ramping up. This
> particular
> issue requires Weston patching in meta-arago, but Weston 2.0 changed some
> APIs
> and those patches no longer apply. Hopefully we'll be able to resolve this
> in
> the near future.
>
> Since this is specific to meta-arago, please direct any further questions
> to
> the corresponding mailing list at meta-arago@arago-project.org
>
> --
> Denys
>
>
> On Mon, Feb 12, 2018 at 04:03:54PM +0000, Adam Lee wrote:
> > I spent a bit of time getting the logs:
> >
> > Any insight as to why this is happening, it would be much appreciated.
> >
> > Adam
> >
> > On Fri, Feb 9, 2018 at 3:26 PM Adam Lee <adam.yh.lee@gmail.com> wrote:
> >
> > > Has anyone successfully brought up Weston desktop shell on the current
> > > master on Beagleboard X15 or AM57xx-EVM? I am having EGL initialization
> > > error. I don't know if it is something I have mis-configured.
> > >
> > > BR,
> > >
> > > Adam
> > >
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--001a114bce0456c1a705652d23c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, Eric&#39;s patch worked. Although I couldn&#39;t ap=
ply them directly, it was easy enough to patch manually.<div><br></div><div=
>I will further direct my issues to meta-arago.</div><div><br></div><div>BR=
,</div><div><br></div><div>Adam</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Mon, Feb 12, 2018 at 1:06 PM Denys Dmytriyenko &lt;<a hr=
ef=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Adam,<br>
<br>
We just switched from Morty to Rocko as our LTS branch couple months ago an=
d<br>
some features are still missing, while teams are ramping up. This particula=
r<br>
issue requires Weston patching in meta-arago, but Weston 2.0 changed some A=
PIs<br>
and those patches no longer apply. Hopefully we&#39;ll be able to resolve t=
his in<br>
the near future.<br>
<br>
Since this is specific to meta-arago, please direct any further questions t=
o<br>
the corresponding mailing list at <a href=3D"mailto:meta-arago@arago-projec=
t.org" target=3D"_blank">meta-arago@arago-project.org</a><br>
<br>
--<br>
Denys<br>
<br>
<br>
On Mon, Feb 12, 2018 at 04:03:54PM +0000, Adam Lee wrote:<br>
&gt; I spent a bit of time getting the logs:<br>
&gt;<br>
&gt; Any insight as to why this is happening, it would be much appreciated.=
<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt; On Fri, Feb 9, 2018 at 3:26 PM Adam Lee &lt;<a href=3D"mailto:adam.yh.=
lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Has anyone successfully brought up Weston desktop shell on the cu=
rrent<br>
&gt; &gt; master on Beagleboard X15 or AM57xx-EVM? I am having EGL initiali=
zation<br>
&gt; &gt; error. I don&#39;t know if it is something I have mis-configured.=
<br>
&gt; &gt;<br>
&gt; &gt; BR,<br>
&gt; &gt;<br>
&gt; &gt; Adam<br>
&gt; &gt;<br>
<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</blockquote></div>

--001a114bce0456c1a705652d23c5--
