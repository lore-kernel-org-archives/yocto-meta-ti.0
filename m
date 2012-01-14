Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f41.google.com (mail-qw0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C3F5E0071E
	for <meta-ti@yoctoproject.org>; Sat, 14 Jan 2012 13:35:08 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qadc14 with SMTP id c14so135223qad.14
	for <meta-ti@yoctoproject.org>; Sat, 14 Jan 2012 13:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PR27mCY43d4KNXTZla8U/o+l8A1264CMdO6+ZXh2TS8=;
	b=NE0Wy4hbf7Y315PKOMThQ0DNKFnXqZQy0FwonQbmqSIbb986edo1gsUm1A4by2Z/Pt
	oMUhSfk358g4n8jMjplp4Mqzy80G3TZJTLOYHcX1EY9jdrtkudlIZXwTRlpHE/32KMhl
	SLQXNyCHq60jcxafyUu+8FY91BJfZadaoEz3I=
MIME-Version: 1.0
Received: by 10.224.196.66 with SMTP id ef2mr7854975qab.94.1326576907564; Sat,
	14 Jan 2012 13:35:07 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Sat, 14 Jan 2012 13:35:07 -0800 (PST)
In-Reply-To: <1326399305-32405-1-git-send-email-raj.khem@gmail.com>
References: <1326399305-32405-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 14 Jan 2012 14:35:07 -0700
Message-ID: <CA+M6bX=jC_u1U1FJPg2kjMZVavU+2q04Bt2s-6W1qzCBu+DCdw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V3] u-boot_2011.09, u-boot_2011.12: Always use gnu ld for LD
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Jan 2012 21:35:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 12, 2012 at 1:15 PM, Khem Raj <raj.khem@gmail.com> wrote:

> u-boot wants GNU ld and cant link with gold
> so when default linker is gold we make sure
> that it still uses good old GNU ld
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Tom Rini <trini@ti.com>

But..

> +Upstream-status: Pending

I suspect Wolfgang would NAK this as he's said before that you should
use the correct toolchain to build things.  So perhaps Inappropriate
[integration] ?

-- 
Tom

