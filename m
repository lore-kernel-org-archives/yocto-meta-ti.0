Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B36FE00764
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 08:34:53 -0800 (PST)
Received: by mail-qc0-f179.google.com with SMTP id e16so13222719qcx.24
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 08:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uxA8AW6L6ZyImCcLzhSC0wsZAMtoIX57DZ2qygySSHM=;
	b=kHQ3CQed9a/kmUfE8ghZe440GWW6tLz6mo68Ji0gbuvu5skPkB7i4lqLJrAHLzQhNB
	POsUnHW8YM3MSdRJFokXZFJQjeUZ7fjSLgRcWVz5IYaFGmaSiB4ikVaifhHvskgCYyen
	74VXZVbSwB/Hmvdj5Kv7ooEBo9eWGBvYyeusvxeE+Sc20qhiZJ8VSuWe7cGiax3lHlqk
	Ub8xx0zXcyctMrhpPhM11xMBqmGNIirdA4uHNB8fenSg+7FPgGfQ8WTW2MVbvBatH1Pr
	cWjcLXWBUPzRr6kxaV7sNSoOIwwo5+f6ZYtzBrBDQmOWeE2YvyyJ9hsyECxX5nP4loxp
	xz0g==
X-Received: by 10.224.5.136 with SMTP id 8mr18971801qav.42.1392136493104; Tue,
	11 Feb 2014 08:34:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 08:34:33 -0800 (PST)
In-Reply-To: <20140211162752.GL3131@edge>
References: <321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
	<20140211162752.GL3131@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 14:34:33 -0200
Message-ID: <CAMCfZKHjb87g08+5fDDVqh3-5MWHoXPmwYsy294tND4=AN8HCA@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Feb 2014 16:34:54 -0000
Content-Type: multipart/alternative; boundary=001a11c2c59a268a3504f22409ce

--001a11c2c59a268a3504f22409ce
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 2:27 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Did you see messages like this during the initial parsing:
>
> WARNING: libgles-omap3-5.01.00.01 ONLY supports hardfp mode for now
>
> Unfortunately, 5.x series of graphics is only available for hardfp mode for
> now...
>

I realized that.
How can I set the machine to use hardfp?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a11c2c59a268a3504f22409ce
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Tue, Feb 11, 2014 at 2:27 PM, Denys Dmytriyenko <span dir="ltr">&lt;<a href="mailto:denys@ti.com" target="_blank">denys@ti.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":c8m" style="overflow:hidden">Did you see messages like this during the initial parsing:<br>
<br>
WARNING: libgles-omap3-5.01.00.01 ONLY supports hardfp mode for now<br>
<br>
Unfortunately, 5.x series of graphics is only available for hardfp mode for<br>
now...</div></blockquote></div><br>I realized that.</div><div class="gmail_extra">How can I set the machine to use hardfp?</div><div class="gmail_extra"><br><br clear="all"><div><div dir="ltr"><div>Regards,</div><div><br>

</div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href="http://www.embarcados.com.br" target="_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c2c59a268a3504f22409ce--
