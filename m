Return-Path: <anders@chargestorm.se>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27259E00C3A; Sun,  6 Mar 2016 23:12:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23047E00C2D
	for <meta-ti@yoctoproject.org>; Sun,  6 Mar 2016 23:12:31 -0800 (PST)
Received: by mail-lb0-f170.google.com with SMTP id xr8so23220147lbb.1
	for <meta-ti@yoctoproject.org>; Sun, 06 Mar 2016 23:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=4A5buTQE6CgKMaF49IqXo2DaRAqd/vqI8eRQDvyC3Fw=;
	b=I69aLYKpLhLu0ewcP6PL/d3+Lm8vUTrWIWtS5S/4ZzvSsO970oaan0YFJS4Qy0is2u
	RbdtOLvS+14IDq1PGMLhVc91MELNJLdZ7hrWgeSuVw7KFgHugv5Sx9vdldsGjKjaMc/F
	VNVbjcBiO8v5fgzHMYzxHx9oLILoufdTb3iojHgVpTJheUc/9dpHewTfso3mS+pD5nKj
	ITyN8N77uW5fsCd/pFMRmvRKJbids3e+THmeI3hkZGNkPGi9D1CuwAiCcL9fPZztUwac
	LpkniNclSFUyIaA9WZ7fa6SkAq0ARX3bvpPy8ECbR9AZK5SobUX4Kfsce/9WZV68iJJ4
	wY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=4A5buTQE6CgKMaF49IqXo2DaRAqd/vqI8eRQDvyC3Fw=;
	b=PI6NghbXJbLxAbJsY2fo8G/0YCx20PbagV/V8Ob/LAoFy+Wq+uihuicS/alIo67AuG
	EKfNgyYtn5gdIQR/C+I9emlfY06WMFrrfAm5YBE9EInxMkiLLpNF9PqpTiry5iuYKcrY
	e+GsBUsuiqZ2jWbeERR2qDBXxvgEdCi9h/wvJauVKHlGjRmK7d0XkJlihb3cg4oSCF0K
	/67Ln7jxDLU5wJCLIyg+OrQUNtJbEdToQnNxaQY/cx6QyDPvg/GBYZMnk05JyCTv5UTD
	XOChb7KgqBKdFCcL9svFQdFi0C6bmPBKW559BOgHkv6imma/n3UfOFnsOhpUW664jWhR
	1eYQ==
X-Gm-Message-State: AD7BkJLl6AB6DZn+kB3LDHszQUPPQTgZA9aZ0kvnpRKHVfXq+YlTP/Qi38o+O3lrBohrXA==
X-Received: by 10.112.126.72 with SMTP id mw8mr7351994lbb.14.1457334749810;
	Sun, 06 Mar 2016 23:12:29 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	qn2sm2555894lbb.49.2016.03.06.23.12.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Mar 2016 23:12:28 -0800 (PST)
Date: Mon, 7 Mar 2016 08:12:27 +0100
From: Anders Darander <anders@chargestorm.se>
To: winiston@futuraautomation.com
Message-ID: <20160307071227.GB25007@ad.chargestorm.se>
Mail-Followup-To: winiston@futuraautomation.com,
	"Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>
References: <20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
	<CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
	<25A507B472054F9B9002D68314A7C388@RD3>
	<CAJTo0LYqPQDVoKdFPP4onF-V+0fJ3fZU5CAk_ao3QdbgN05RRA@mail.gmail.com>
	<7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
MIME-Version: 1.0
In-Reply-To: <7C340AF3BCDD49AB919DB23371FBDEE5@RD3>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>, "Burton,
	Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [linux-yocto] [OE-core] How to integrate third party application software to yocto image
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
X-List-Received-Date: Mon, 07 Mar 2016 07:12:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160305 06:45]:
> winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
> Loading cache: 100% |##########################| ETA:  00:00:00
> Loaded 2176 entries from dependency cache.
> ERROR: ParseError at /home/winiston/poky/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb:12: Could not inherit file classes/bash-completion.bbclass

> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> winiston@winiston-VirtualBox:~/poky/build$ 

Well, the networkmanager recipe in mete-oe needs a class,
bash-completion, which isn't available to you.

> meta              
> meta-yocto        
> meta-yocto-bsp    = "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"

This tells us that you're using the jethro branch from OE-core. This
one doesn't have the class that you required earlier. The class is only
avalaible in the master branch.

> meta-oe           = "jethro:12fae239641cc7a72c509a1a0841ab8bb06ce7f0"

Well, this one lies to us, as you have only copied meta-oe. Had you
cloned the repository instead, we would be able to tell you that you're
not using the jethro branch of meta-oe, but rather the master branch, a
lot easier.

You need to use the correct branches for all your layers. Mixing release
branches for certain layers, and master branches for other is a no-go,
unless you know what you're doing. (And can handle the pain yourself).

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

