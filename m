Return-Path: <leo.e.meza@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2FBBE00953; Wed, 26 Sep 2018 06:28:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.221.50 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (leo.e.meza[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F7D3E006F1
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2018 06:28:17 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id z3-v6so15198641wrr.13
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2018 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pCyb2KWg2sStMhA6UVwNEDkvQ/xslMpyWJLgHUTC8J4=;
	b=ntmwVs3RbfktuQMv4duARXNPsejn2/1Bqlq5/P6knqq2Uv56iJmqAx3rkGCyahMTxy
	9//aVrGzLFV/qb5+It7K6WiQ9lddTRGUT52afjccsd5AEjCouxyIJQbwQmioJGT78Lvt
	JRkSCgrZhjQoiO+rAU7yS2QHv5Z8zM7Eb1VhDzEeczPKmWjQNtAl+wzuiWWNtEza/cHf
	mj20HY030RyvbpwZzdNJjmwmyluXWsEDkahoEZN00yUZKL+IVcKaOzH77YhNf2C7xXc2
	anQfFAg4aVTh7LFHAnXVvE189HrUd7QvxI4MwCL9MJkcy2Jniio+plMfxReNs0WSSArw
	3siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pCyb2KWg2sStMhA6UVwNEDkvQ/xslMpyWJLgHUTC8J4=;
	b=msWFjByElvRMWetjuE7ZlU1ZIhGi6XagRgUrtgX/Gsxjtn3xGjxvdVT+I7CIkR++NP
	+owMy6P5rjrfQXIPB0bURJ6hfTR2CdXOxcQ2ZsdrASK+8zqvMc9iRFL/x36MyOsmSRz/
	QiUucreq1AjdTsIeEFh50zZLMV3NUjGaE671SmhyjZRoJ+YF+WHg/GxRf5aDl26fbiTR
	E9b3Q2vCKuyAgjwkhswl4T+9x2buYM23vIH5fIS+CLvsIPh4tPaLrpviU3G+DqvyHx41
	7HyzCXMSfxYrdAclYqHawvjiZ2MQA0F8zEsDWJzKSS4brLetJNxJN4cHz8TTETdNTJjw
	D07g==
X-Gm-Message-State: ABuFfojwV3/TxxjAJsGmtcSQb+OHnM0RLHM6hlEWZOZjJcpLD92cF4Jf
	mj5NgStPhF4fE3sBeYQiP3xSAymZiCcJzwGmQjs=
X-Google-Smtp-Source: ACcGV62I+mmQg3vYLDVxUPx0xnXzvPp1fDMccuPQH8Isw7Rl+dCtHWBsEG4YN/Sn0kIFyYRkGtozYDHyOqcHe2JsZ0Y=
X-Received: by 2002:adf:ff08:: with SMTP id k8-v6mr5416813wrr.15.1537968496275;
	Wed, 26 Sep 2018 06:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR07MB486664B157A30E27F0FAE23692160@BN7PR07MB4866.namprd07.prod.outlook.com>
In-Reply-To: <BN7PR07MB486664B157A30E27F0FAE23692160@BN7PR07MB4866.namprd07.prod.outlook.com>
From: Leo Meza <leo.e.meza@gmail.com>
Date: Wed, 26 Sep 2018 06:28:03 -0700
Message-ID: <CADrbpyyj=bONWiAS7sE0hFGM10p244oGsnWZP_WKSkxaqULM6Q@mail.gmail.com>
To: "Tsai, Matt" <matt.tsai@thermofisher.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Poky and meta-ti advice for Beaglebone Black
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
X-List-Received-Date: Wed, 26 Sep 2018 13:28:17 -0000
Content-Type: multipart/alternative; boundary="000000000000e579b70576c6316e"

--000000000000e579b70576c6316e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Matt,

I've been having some success with the "rocko" branches (meta-ti, etc), and
using the "am335x-evm" machine for beaglebone black.

I haven't done any i2c yet, but Ethernet and USB are working fine. I'm
still on the left of the learning curve though, maybe someone else on this
thread has better advice.

-Leo

On Tue, Sep 25, 2018, 4:19 PM Tsai, Matt <matt.tsai@thermofisher.com> wrote=
:

> Hi all,
>
>
>
> I am new to Yocto and was trying to use poky and meta-ti to customize
> Linux to run on Beaglebone Black. There are a couple of questions I
> encountered, hopefully I can get some advice here:
>
>    1. What is the recommended poky and meta-ti branch/tag to use?
>    2. If we need to enable some common device support such as Ethernet,
>    USB host port, I2C, =E2=80=A6etc., what do we need to modify on these =
recommended
>    poky and meta-ti software?
>
>
>
> Thank you for your help!
>
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--000000000000e579b70576c6316e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Matt,<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;=
ve been having some success with the &quot;rocko&quot; branches (meta-ti, e=
tc), and using the &quot;am335x-evm&quot; machine for beaglebone black.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I haven&#39;t done any i2c =
yet, but Ethernet and USB are working fine. I&#39;m still on the left of th=
e learning curve though, maybe someone else on this thread has better advic=
e.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Leo</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Sep 25, 2018, 4:19 PM Ts=
ai, Matt &lt;<a href=3D"mailto:matt.tsai@thermofisher.com">matt.tsai@thermo=
fisher.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_5003486694829224128WordSection1">
<p class=3D"MsoNormal">Hi all,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I am new to Yocto and was trying to use poky and met=
a-ti to customize Linux to run on Beaglebone Black. There are a couple of q=
uestions I encountered, hopefully I can get some advice here:<u></u><u></u>=
</p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"m_5003486694829224128MsoListParagraph" style=3D"margin-left:0i=
n">What is the recommended poky and meta-ti branch/tag to use?
<u></u><u></u></li><li class=3D"m_5003486694829224128MsoListParagraph" styl=
e=3D"margin-left:0in">If we need to enable some common device support such =
as Ethernet, USB host port, I2C, =E2=80=A6etc., what do we need to modify o=
n these recommended poky and meta-ti software?<u></u><u></u></li></ol>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thank you for your help!<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank" rel=3D"norefe=
rrer">meta-ti@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/me=
ta-ti</a><br>
</blockquote></div>

--000000000000e579b70576c6316e--
