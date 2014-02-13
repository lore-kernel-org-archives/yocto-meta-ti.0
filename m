Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43A19E00800
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2014 10:31:41 -0800 (PST)
Received: by mail-qc0-f175.google.com with SMTP id x13so18165799qcv.6
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2014 10:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KyzdQHE7WZJuSzlP0PCqwd8DTPoV674vvec+NUBPBsY=;
	b=IqIxi8HBJ18RcwhPuZo+5rtJc9it2UHSRK+bY+QdZHb/Y7LcZ8Y7f85drN53H2xo98
	5dCsyLfEWl0PkGJLjldRc/2Q9clHdNSUWaqa5Qk45Xcyt1tv7GR1J26dHWzjip42jsKR
	YdjXbiJNEpwMR2NFNdeeGGk8nQK8WUA1+ZjIfLuDAJQp0BHmzjec9j4+fmV1Xp8RDNz/
	igu0zevopxU/1slAwZp9n6Gkx2Dg/wwDFEzM5dWiRWHQpVoR1VwywD82soyMj8Bxe19K
	rmJo49//6+f52xfau+1dtqjMFaispigMFmG6T4CcMOeO3MGd26ooGiOyMlF+mDor1zQA
	639g==
X-Received: by 10.140.106.225 with SMTP id e88mr4905151qgf.66.1392316300542;
	Thu, 13 Feb 2014 10:31:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Thu, 13 Feb 2014 10:31:20 -0800 (PST)
In-Reply-To: <20140212162334.GE4346@edge>
References: <CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
	<20140211162752.GL3131@edge>
	<CAMCfZKHjb87g08+5fDDVqh3-5MWHoXPmwYsy294tND4=AN8HCA@mail.gmail.com>
	<20140211164725.GN3131@edge>
	<CAMCfZKH2dEsd8=qihsETyA0-pdC08pX=o-SKyOKhvXqkVGy75w@mail.gmail.com>
	<20140212162334.GE4346@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 13 Feb 2014 16:31:20 -0200
Message-ID: <CAMCfZKGFg-CVDmX-O0YK+7pTEo67Yrzd8-uZpLN2y0p7aFy2ZA@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2014 18:31:44 -0000
Content-Type: multipart/alternative; boundary=001a113a8626824b3c04f24de6be

--001a113a8626824b3c04f24de6be
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 12, 2014 at 2:23 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> We use it in our Arago distribution and SDKs and there are image recipes in
> meta-arago for that. If you use meta-ti with other distributions, you'd
> have
> to come up with your own image recipe or modify one of the existing ones.
>

I realized that meta-arago is not compatible with dora branch. Is there any
schedule to get this version supported?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a113a8626824b3c04f24de6be
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Wed, Feb 12, 2014 at 2:23 PM, Denys Dmytriyenko <span dir="ltr">&lt;<a href="mailto:denys@ti.com" target="_blank">denys@ti.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":59r" style="overflow:hidden">We use it in our Arago distribution and SDKs and there are image recipes in<br>

meta-arago for that. If you use meta-ti with other distributions, you&#39;d have<br>
to come up with your own image recipe or modify one of the existing ones.</div></blockquote></div><br>I realized that meta-arago is not compatible with dora branch. Is there any schedule to get this version supported?</div>

<div class="gmail_extra"><br><br clear="all"><div><div dir="ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href="http://www.embarcados.com.br" target="_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a113a8626824b3c04f24de6be--
