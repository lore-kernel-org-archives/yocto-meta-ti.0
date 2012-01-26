Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB2B1E00596
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 10:01:53 -0800 (PST)
Received: by qcpx40 with SMTP id x40so523886qcp.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 10:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wP4IQXjmS7nbgk/CYj5XLSvVMUBZZKpLxscYcOBJTeM=;
	b=N02W3XUFK3pKLDT+Owksrmy4JEiNwPlz1Dg7k+aIOuKrzkGso43QDoB7/cSXwsYsnj
	+mFqSMjRBV77TyB1XaRiuetcINGUApO6onUJOIPGdVV13RFCrQztK0V3zs3Rm/BXSFHz
	KlM8KRtRAeiAVnkPN+eFk1XSguDomJpyBx8Oc=
MIME-Version: 1.0
Received: by 10.224.185.131 with SMTP id co3mr4040838qab.94.1327600912766;
	Thu, 26 Jan 2012 10:01:52 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Thu, 26 Jan 2012 10:01:52 -0800 (PST)
In-Reply-To: <1327599532-31609-1-git-send-email-koen@dominion.thruhere.net>
References: <1327599532-31609-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 26 Jan 2012 11:01:52 -0700
Message-ID: <CA+M6bXmFYnz62unD5Mq5-3cbTmk4rpuySETP7Kd134F_k+qXvw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-ti33x-psp 3.1: add dto patch to fix problems with various sd cards
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
X-List-Received-Date: Thu, 26 Jan 2012 18:01:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 26, 2012 at 10:38 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

I know the patch isn't yours but should we perhaps go in and make the
patch more obvious?  The function we're patching does a lot of
guesswork to find 'dto' and then we just say 'use the max'.  Why not
also go rip out that logic?

-- 
Tom

