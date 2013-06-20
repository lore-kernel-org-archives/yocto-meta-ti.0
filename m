Return-Path: <richard.rojfors@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A33EE013EC
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 22:28:00 -0700 (PDT)
Received: by mail-ea0-f173.google.com with SMTP id g15so3679000eak.32
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Df1Do20CCr/+7GPfOmQkq9lvTQOVI5wt6Ac/BDkBV9c=;
	b=G/5d1+/v/Giikn3Vm87uj90HGOLVqt2Kz0xJJ/XXERtwCIx5wgH7QuJR0aj/uR9uol
	ggBbJSUX1Dw90D4xV6WWkDbJ/ekbYAEkArL5DW3s1REF9n2j15xvDdzaMML7OcU9cE52
	i4LT62hHq/WGPJMz3Z6Fs6QKHkAFBNowdLKiXz32EPqi9nQIHJ49q5Bu5aZYp4VjYgYs
	JsfiIqJYQTBbez+rG8ADE98HGWzNjlT1FgXXVcO1aOzz5qmMm9TzEcvLOZ64sKJ5xKMN
	nnBcwUYRHX9SWyrGxcQ608ujGJf6WYfhIDMQKICn7Vx3P+omKszfP1jPe2kP0SLc/RXr
	A/fA==
MIME-Version: 1.0
X-Received: by 10.14.177.196 with SMTP id d44mr5651289eem.35.1371706079420;
	Wed, 19 Jun 2013 22:27:59 -0700 (PDT)
Received: by 10.15.45.134 with HTTP; Wed, 19 Jun 2013 22:27:59 -0700 (PDT)
In-Reply-To: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
Date: Thu, 20 Jun 2013 07:27:59 +0200
Message-ID: <CAHB-PjmDm6Y61trwGWbnfLrvcB0VE79_4naU_SP3-FEzkLYKSw@mail.gmail.com>
From: =?ISO-8859-1?Q?Richard_R=F6jfors?= <richard.rojfors@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Thu, 20 Jun 2013 05:28:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,


On Thu, Jun 20, 2013 at 4:04 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi there,
>
> not sure if this is the right place to ask... but since i am about to ask=
 about QT5, OE and TI platforms, i am starting here!
>
> so, i read a couple of blog posts about getting Qt5 on beaglebone, howeve=
r it's not clear to me what's the latest status is. has anybody been able t=
o use/enable OpenGLes either with KMS, or directfb or eglfs platform driver=
? The only thing i have seen are references to using the 'minimal' platform=
 driver.
>
> if so, can i get some pointers?

I use Qt5 on pandaboard, with the Qt5 kms driver. There are some
things needed to be done in Qt5 KMS to make it link with the OMAP4 PVR
headers. And since you don't support the hardware pointer that code
has to be avoided.

--Richard

