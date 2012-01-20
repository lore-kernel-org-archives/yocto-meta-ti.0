Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85A85E01346
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2012 07:40:44 -0800 (PST)
Received: by qcpx40 with SMTP id x40so432364qcp.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2012 07:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sXmD77LpGu9+UZrEzq+Lp5l5o/09X862Qgek9lTpIvk=;
	b=P5mBE7Y7uSd37vGC2PsGEo+HqM2pz6RIvnYYi1fOIp1+AAIAVqxtRuYSp/JwPAhOFt
	DDV9mnYIqX5IQ3e7F2JVpIZtOnUpyGtKPMHSTCaZS8al1CcStYlKdfmPZ1wY4is3xczM
	1kPnLX02PHGV03a/lVj0mKwZz55kGyv1MW3Xo=
MIME-Version: 1.0
Received: by 10.224.111.6 with SMTP id q6mr34649396qap.65.1327074043942; Fri,
	20 Jan 2012 07:40:43 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Fri, 20 Jan 2012 07:40:43 -0800 (PST)
In-Reply-To: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
References: <1327063792-2685-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 08:40:43 -0700
Message-ID: <CA+M6bXkSKimGzpL+-W4JQ5095SiwJx7iukM8y-X8+icZjbPLHw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: fix L2 cache on non-omap4 platforms
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
X-List-Received-Date: Fri, 20 Jan 2012 15:40:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 20, 2012 at 5:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Tom Rini <trini@ti.com>

And to address Andreas' comment, for now the proper solution is still
under discussion so an isolated revert is fine here.

-- 
Tom

