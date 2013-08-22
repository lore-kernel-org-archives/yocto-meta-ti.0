Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A735CE00406
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 10:08:51 -0700 (PDT)
Received: by mail-oa0-f47.google.com with SMTP id g12so3901956oah.6
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jpbU2TlaT0SPbnKa3J3WCbGV8o4TweppIp+pPwzewwo=;
	b=eBDY+f0gqKvdmWp6lmH6W7hp7PawU0ZK2MmI5mW6+O7ntpKOMIn30IXMbnGP+cDY6r
	fd91DnHlEhqi407jqfzRDKVArsf9bouJKHEcXSPiw388F4mlXqsH7UXkmS+aWHTmejw8
	XGKfIXxD44Q5ZarIDPMgJF2UDaibXoepiZlTVVSdvjCTXd69hIcfGaxI7PkPoIny8oK7
	6tbyVDAX6gWfKZCs0pJ1hT4YFhHE8GN2fRd+82JXmFvfxE9OUvJpzQ+tHElyF3oi9zYx
	k7j0xBZPQsQPS7mBkSnQKgTcxCYtfuD7zyLRaI0oP6ksaaQkDjCKG1HkntYl1mw27+f9
	86qA==
MIME-Version: 1.0
X-Received: by 10.182.227.227 with SMTP id sd3mr15473966obc.68.1377191330852; 
	Thu, 22 Aug 2013 10:08:50 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 22 Aug 2013 10:08:50 -0700 (PDT)
In-Reply-To: <20130822153850.GB25749@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
	<20130822024616.GA25063@edge>
	<CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
	<20130822153850.GB25749@edge>
Date: Thu, 22 Aug 2013 13:08:50 -0400
Message-ID: <CAFZh4h8Q=zmMbpDOv+BjmVVroC-J7K9E5=PsHo_xoPEbLsuE+A@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 22 Aug 2013 17:08:52 -0000
Content-Type: multipart/alternative; boundary=001a11c359c41035a504e48c584e

--001a11c359c41035a504e48c584e
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 11:38 AM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> Good, I'll just keep nagging you to abandon Denzil and switch to at least
> Dylan - it's absolutely trivial to restore the machine configs that used
> to be
> in Denzil - I already gave you the exact command... :)
>
> I know, I'm doing it the hard way.  And I appreciate the command (and will
do it eventually) but I'm not a git expert so I'm trying to pick up what
you're laying down :)  I'm trying to understand the mechanics before I get
fancy.

B

--001a11c359c41035a504e48c584e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 22, 2013 at 11:38 AM, Denys Dmytriyenko <span =
dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
</div>Good, I&#39;ll just keep nagging you to abandon Denzil and switch to =
at least<br>
Dylan - it&#39;s absolutely trivial to restore the machine configs that use=
d to be<br>
in Denzil - I already gave you the exact command... :)<br><span class=3D"HO=
EnZb"><font color=3D"#888888"><br></font></span></blockquote><div>I know, I=
&#39;m doing it the hard way. =A0And I appreciate the command (and will do =
it eventually) but I&#39;m not a git expert so I&#39;m trying to pick up wh=
at you&#39;re laying down :) =A0I&#39;m trying to understand the mechanics =
before I get fancy.</div>
<div><br></div><div>B</div><div>=A0</div></div><br></div></div>

--001a11c359c41035a504e48c584e--
