Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDCA8E006B9
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 06:48:20 -0800 (PST)
Received: by mail-qc0-f169.google.com with SMTP id w7so13245989qcr.0
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 06:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3xwPs2evOsDWlTOXbqHY8VAG5j3yTzywg/PjuXuDsg8=;
	b=ODez5y1byh42VFe+bD6SQkvq01z3bwRDpIWzoionGztu52bA/KMj+0yWx/1udV7RZw
	gw2cDkXgbiw/Z8oJ+Dc0oUPeR8EgDIjCJIF0/4s5v+Q0KpYaDww3zWbqNKjymkwgNc6U
	9hd2xt+7Apx36lB9N+VWF93zAZQ5cj0OrwPIvDqXELrY7bwDvF74w/TdVzWyaTpoGKM8
	n0PE//fQu0DyjxnR4T7cx0c8L4bpR50YAaZtY47Lgmbeu1NAx9/DqNFQW4TvQviHQKat
	LDy1WwCYtu8Wfd7N32ol8JOQlVDpSnH2C614nVsYSnUBUTMUp5lYUFndbU3m8CTINvz+
	O2bw==
X-Received: by 10.224.160.83 with SMTP id m19mr57427652qax.21.1392130099107;
	Tue, 11 Feb 2014 06:48:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 06:47:59 -0800 (PST)
In-Reply-To: <20140211144551.GF3131@edge>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 12:47:59 -0200
Message-ID: <CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 14:48:23 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aa09de8204f2228c4d

--047d7bacb2aa09de8204f2228c4d
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 12:45 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> There were several updates and fixes since 4.09.00.01 version of Graphics
> SDK,
> the latest being 5.01.00.01. Unfortunately, X11 and DRM handling was not
> supported and un-tested for some time, but 5.01.00.01 was meant to fix
> some of
> those issues...
>

Thanks Denys,
How can I choose to build this newer version?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--047d7bacb2aa09de8204f2228c4d
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Tue, Feb 11, 2014 at 12:45 PM, Denys Dmytriyenko <span dir="ltr">&lt;<a href="mailto:denys@ti.com" target="_blank">denys@ti.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":10m" style="overflow:hidden">There were several updates and fixes since 4.09.00.01 version of Graphics SDK,<br>


the latest being 5.01.00.01. Unfortunately, X11 and DRM handling was not<br>
supported and un-tested for some time, but 5.01.00.01 was meant to fix some of<br>
those issues...</div></blockquote></div><br>Thanks Denys,</div><div class="gmail_extra">How can I choose to build this newer version?<br><br clear="all"><div><div dir="ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>

Diego Sueiro<br><br>Administrador do Embarcados<br><a href="http://www.embarcados.com.br" target="_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--047d7bacb2aa09de8204f2228c4d--
