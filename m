Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97B00E00441
	for <meta-ti@yoctoproject.org>; Sat, 17 Aug 2013 15:20:19 -0700 (PDT)
Received: by mail-ob0-f171.google.com with SMTP id tb18so3371730obb.2
	for <meta-ti@yoctoproject.org>; Sat, 17 Aug 2013 15:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6sOvs6KN+3YPXkjACrkFKsAp/rZFgFwsCgdvLFyRwVo=;
	b=P8EIiA4VWtjtj5JOgyxU6gjSxgXT8zkNwtQbFWBFxXFgBCuBl3FUKFt1WZBCMjsUEs
	BR4rHw7oWNEf82QZQK6rg2mvkQ4U+m8sBeATrOvSFDIGyoHb8Bb2aNxXZeyS/N0LNKW7
	PZCZO7KQWssu5LVK3x4+E/2ZFZ1Y9Ezg1J5jIB5whClBCLPelbhxXkTDzE9ztCmBP2yF
	VbHvv9jEUyCP7NTfcLayZoyCsnXut674IBRPZU14oxwQzKmLF/BC6uttJ95mfNGUy4en
	IXAW0KYCc/CFN/hL/V3ovs4mFgxtctEEYGu44PYl77HpGLMFFfNZDQ/EPw0W6YJpdxDA
	6Llg==
MIME-Version: 1.0
X-Received: by 10.60.63.167 with SMTP id h7mr3128257oes.43.1376778018190; Sat,
	17 Aug 2013 15:20:18 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Sat, 17 Aug 2013 15:20:18 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Sat, 17 Aug 2013 15:20:18 -0700 (PDT)
In-Reply-To: <20130817214543.GS4931@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<20130817214543.GS4931@edge>
Date: Sat, 17 Aug 2013 18:20:18 -0400
Message-ID: <CAFZh4h-Y8yUyZ2kLuqwRUakucYvurnYqB73zsJRYfUUHhQrJew@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sat, 17 Aug 2013 22:20:19 -0000
Content-Type: multipart/alternative; boundary=001a11c213a4b57a0304e42c1c10

--001a11c213a4b57a0304e42c1c10
Content-Type: text/plain; charset=ISO-8859-1

On Aug 17, 2013 5:45 PM, "Denys Dmytriyenko" <denys@ti.com> wrote:
>

> BTW, didn't I tell you to look for a possible fix in one of those TI81x
repos
> on arago-project.org? :) It was right there, the third from the top!
>
>
http://arago-project.org/git/projects/?p=linux-dvr-rdk-dm81xx.git;a=commitdiff;h=b5c066e7c670e830c322693b2c9da65508c189b2

To be honest, I did look at those and did a search for 81x and scanned the
results and didn't see it :-(
>

> Congratulations, you persistence has paid off! :)
>
> Looking forward to seeing patches from you, along with taking
maintainership
> of TI81x platform in meta-ti... :)

Yea, that's what I'm afraid of.  I'll have no problem doing it in my
copious spare time ;-)

--001a11c213a4b57a0304e42c1c10
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Aug 17, 2013 5:45 PM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailt=
o:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;</p>
<p dir=3D"ltr">&gt; BTW, didn&#39;t I tell you to look for a possible fix i=
n one of those TI81x repos<br>
&gt; on <a href=3D"http://arago-project.org">arago-project.org</a>? :) It w=
as right there, the third from the top!<br>
&gt;<br>
&gt; <a href=3D"http://arago-project.org/git/projects/?p=3Dlinux-dvr-rdk-dm=
81xx.git;a=3Dcommitdiff;h=3Db5c066e7c670e830c322693b2c9da65508c189b2">http:=
//arago-project.org/git/projects/?p=3Dlinux-dvr-rdk-dm81xx.git;a=3Dcommitdi=
ff;h=3Db5c066e7c670e830c322693b2c9da65508c189b2</a></p>

<p dir=3D"ltr">To be honest, I did look at those and did a search for 81x a=
nd scanned the results and didn&#39;t see it :-( <br>
&gt;</p>
<p dir=3D"ltr">&gt; Congratulations, you persistence has paid off! :)<br>
&gt;<br>
&gt; Looking forward to seeing patches from you, along with taking maintain=
ership<br>
&gt; of TI81x platform in meta-ti... :)</p>
<p dir=3D"ltr">Yea, that&#39;s what I&#39;m afraid of.=A0 I&#39;ll have no =
problem doing it in my copious spare time ;-) <br>
</p>

--001a11c213a4b57a0304e42c1c10--
