Return-Path: <tom.rini@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2C45E013A3
	for <meta-ti@yoctoproject.org>; Fri,  9 Mar 2012 07:54:19 -0800 (PST)
Received: by iagw33 with SMTP id w33so3044805iag.35
	for <meta-ti@yoctoproject.org>; Fri, 09 Mar 2012 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=FoWJI9b8V0BNo47jUFQ4eusxvRwEt6R1fmRbq1iY0xg=;
	b=qp4+6XRfrXHcPUgtz0CfdM9XLrgHoGgf4UD2h2nvr0JPY1b490avcYMgPyWB3B6PDc
	RBteWUZje2/Rmu2ZMIAcxcgHiaNVZ9vmgN8cBsuj/XlpLhqntIv69OBINW1KpP+0D7mo
	Mf5LlYyKeJ/HqROhfIVuXX1ho8vS0ZLDvDYCdXFRIZ795hgb3IWwFwz7TD7bO83sgly3
	m3fYecogrR86RCY49sJqTfY+Df6pvtBqAaRq3miDOpp6TPbBi6Z8BlX76733bJh9Hi1m
	D8f2NErXaObLj+FduwO2drqFhI5u+Se0Oem2VvjZy5DfxFTSwLqOpQqNUzPf14mUY2BC
	5vNw==
Received: by 10.50.76.163 with SMTP id l3mr4083244igw.10.1331308459445;
	Fri, 09 Mar 2012 07:54:19 -0800 (PST)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id vb4sm2224209igc.10.2012.03.09.07.54.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 07:54:18 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Fri, 9 Mar 2012 08:54:19 -0700
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120309155419.GA11879@bill-the-cat>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<1331235244-5173-5-git-send-email-trini@ti.com>
	<C56154A0-7259-4B52-92BE-C29433260320@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <C56154A0-7259-4B52-92BE-C29433260320@dominion.thruhere.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 4/4] am335x-evm.conf: Add 'ubi' to IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 09 Mar 2012 15:54:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 09, 2012 at 07:16:22AM +0100, Koen Kooi wrote:
> 
> Op 8 mrt. 2012, om 20:34 heeft Tom Rini het volgende geschreven:
> 
> > We also change to using '+=' not '?=' with IMAGE_FSTYPES and add the
> > required MKUBIFS_ARGS / UBINIZE_ARGS.  These are placed next to the
> > line that sets us to use the PSP kernel tree and reference the TI wiki
> > for the source of our info.
> 
> The OE classic way of documenting is a lot better and doesn't rely on
> wiki pages but on the submitter actually checking the output of the
> commands. So please use the old style way of documenting the params.

I disagree here.  The wiki page here has the calculations as to why the
erase size is 126976 whereas just doing ubiattach will only print out
the in-use value.  How about adding a line about verifying these with
ubiattach or dmesg ?

-- 
Tom

