Return-Path: <paul.marc.liu@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD7E5E00BF6; Thu,  8 Jun 2017 08:36:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.172 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (paul.marc.liu[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6371BE00B18
	for <meta-ti@yoctoproject.org>; Thu,  8 Jun 2017 08:36:05 -0700 (PDT)
Received: by mail-qt0-f172.google.com with SMTP id w1so45661140qtg.2
	for <meta-ti@yoctoproject.org>; Thu, 08 Jun 2017 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y3Yy7PaOWydiFvaZt9BQm/PXLIcQKOvE/3J7TVDbL5Y=;
	b=YGToQIGqhfS2Rbf9n0j8MKMdQ/u1sojZzyUDmKLUZqyXBf2YKET1+GdMzvBdtkCwXt
	rgs4Dqs9Mt8vpZNPnVN9kSD+JTkEl0J6OC7ogAdNvRrBCj+l72P/cxdFHP/dxPfg6vYg
	z8TFW07mZhBkH0pFfGzS8DPPNye/9AN+mMzOgVeKZK+tW6ARdOHIibc67+Dxn44Z27e+
	/UqeWlH35llHhbXcb4PgZudWL+hKyZqgxcWXxSJIVT/6A23FltOr/lTRsmDTK8UdygtA
	4E4EKbIzQCP2631wps5rbaEkNSmlwQXcYIQ5mJ3mAHI2n2/EeCvyJu0RJlLh0BytMPxn
	x/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y3Yy7PaOWydiFvaZt9BQm/PXLIcQKOvE/3J7TVDbL5Y=;
	b=COIEVj14ljPPBND21f0oY/MBSbsFvREq1QH71vnK2JqPYUqcr64W+2uBhPw3WLmcm7
	Eq10so+yNVCVldQlUdhnDia7q/dqPZBjd5xPnINeVXwOI3xWzkR5QnA1JcwTLdtYIgcj
	C4ZFGpGe1vwbYwa6EmnUaM/xYK97spGhoDhte1svjklP8QpD8bhefYz0dK7A0R+MZGpE
	3UrYzdMB3dQnUXy9Xy9m/Qk933Wvt3fgPdFIJ0vGmb0kHwjN2kQhBMn3vRbhvOOw5eKj
	bN+rpjfDirb42QMZHCIa1ri3FlsqGq67R+gshFP6eICvqWemIGSJqiaXfG7U+AOaL3J7
	ZSKw==
X-Gm-Message-State: AODbwcAdMHXlxd1Ee+oORC6FzHbgPxaawE1j0CmyF9OxL3tT7LzZhBCL
	eLjMGEo67nMyXOMVu8sgANDuHHymtQ==
X-Received: by 10.237.62.135 with SMTP id n7mr7768320qtf.0.1496936164489; Thu,
	08 Jun 2017 08:36:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.18 with HTTP; Thu, 8 Jun 2017 08:36:03 -0700 (PDT)
In-Reply-To: <9d0b2fc3-cfd6-f392-79b9-792025ba3dc8@bytesatwork.ch>
References: <9d0b2fc3-cfd6-f392-79b9-792025ba3dc8@bytesatwork.ch>
From: Paul Marc Liu <paul.marc.liu@gmail.com>
Date: Thu, 8 Jun 2017 08:36:03 -0700
Message-ID: <CAC_8XzC1S81SxichcepHw2LjS0MF9kyxQ6QaFvOw8WbHk_aaJA@mail.gmail.com>
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Cc: meta-ti@yoctoproject.org
Subject: Re: Pyro branch?
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
X-List-Received-Date: Thu, 08 Jun 2017 15:36:08 -0000
Content-Type: multipart/alternative; boundary="001a11423ba055ff4c0551749c03"

--001a11423ba055ff4c0551749c03
Content-Type: text/plain; charset="UTF-8"

All:

I am also interested in the beaglebone black target using meta-ti (or
meta-beaglebone - which, in my opinion, should be under meta-ti) on pyro.
I am currently using the RCN (debian and ubuntu) build but would like to
port specific features on pyro / meta-ti.  Is anyone working on this
effort?  I would like to estimate and coordinate efforts / divide and
conquer.

Thank you.

Best Regards,

Paul Liu

On Thu, Jun 8, 2017 at 3:59 AM, Daniel Ammann <daniel.ammann@bytesatwork.ch>
wrote:

> Hi
>
> Is there going to be a pyro branch for meta-ti?
> I know that in the past there was only a new branch every other yocto
> release, but since there was a morty branch, maybe the rule is not
> valid anymore.
>
> Thanks and kind regards
>
> Daniel
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>



-- 

- Message content Private and Confidential -
- If message was forwarded by mistake, please destroy
message and attachments immediately. -

--001a11423ba055ff4c0551749c03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All:<div><br><div>I am also interested in the beaglebone b=
lack target using meta-ti (or meta-beaglebone - which, in my opinion, shoul=
d be under meta-ti) on pyro.=C2=A0 I am currently using the RCN (debian and=
 ubuntu) build but would like to port specific features on pyro / meta-ti.=
=C2=A0 Is anyone working on this effort?=C2=A0 I would like to estimate and=
 coordinate efforts / divide and conquer.</div><div><br></div><div>Thank yo=
u.</div><div><br></div><div>Best Regards,</div><div><br></div><div>Paul Liu=
</div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Thu, Jun 8, 2017 at 3:59 AM, Daniel Ammann <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:daniel.ammann@bytesatwork.ch" target=3D"_blank">daniel.ammann@b=
ytesatwork.ch</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br=
>
<br>
Is there going to be a pyro branch for meta-ti?<br>
I know that in the past there was only a new branch every other yocto<br>
release, but since there was a morty branch, maybe the rule is not<br>
valid anymore.<br>
<br>
Thanks and kind regards<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Daniel<br>
--<br>
______________________________<wbr>_________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"noreferr=
er" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/meta-ti<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0<=
br>- Message content Private and Confidential -<br>- If message was forward=
ed by mistake, please destroy<br>message and attachments immediately. - </d=
iv>
</div>

--001a11423ba055ff4c0551749c03--
