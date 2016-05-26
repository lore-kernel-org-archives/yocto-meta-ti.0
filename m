Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 011FDE00DD7; Thu, 26 May 2016 10:46:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99A17E00D36
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 10:46:21 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id w184so129259648oiw.2
	for <meta-ti@yoctoproject.org>; Thu, 26 May 2016 10:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc; bh=O+lOj1Gsee0cNLydfn1t5AL+2e2z2Bgu85ULMK/Fpns=;
	b=G9GI757o8Q0PrtHPjPhuvbaFeUG+N9qv7GRD4jzPevBG4TJow5vJt7VIa2k3Nd7O05
	ZaUtDga67cNpiEl/aLrr3bBFOc0qAuMka02BWvNuTmNRhvLP4+gpcMuRjIhVwuHg1I/Z
	XrNKy+FlyrRPzameth3kwFVhfPA0pG+QRsYVTyjSS/QIPnIcafqkF/j9svPMws4lBL9U
	OEnnxzxhGUolwnVT+qObBPDHTtV9+KdXnmGF7KQGUwo0fM/OVK+eW+KSCcw5wZYaK8Te
	jvJexWBdfUE/6rAI7c1Ib+xzTcsvZFzxLhxJJpFih/SEyyQjXVXUBeKVf6KLwhu1rLSf
	b6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=O+lOj1Gsee0cNLydfn1t5AL+2e2z2Bgu85ULMK/Fpns=;
	b=XqkkHR/AKjJcmKkOY44mXf6AovM6Oan3zVComwzSXePVY12XQLNXLJIXOgcO6EiWgF
	xU46RJ5BJ8E1wIialGmSV8JxgsJ68guYc57OcotJoDjSokZj62ZZXneJMtYau9UT8QNJ
	wgx6bOBdLay5t35eGt35jR1LKUop2jD/xzEkYPHQccD/WGbmug9gsCasvNG+nvnOZ3I/
	PziLSe8bIuk1yb3+vi6PScw1r0LN9WUGOgmo6gOo+DLE3L+/GXIcbWqp56cUGhELu2J1
	tlQtUEKwPeBFj6JUav2NYVyN2ukFxeepwxcnaitbdAMffoORUeIEZPrV7bmvfbyDvqKM
	lcEQ==
X-Gm-Message-State: ALyK8tL+0N9ImGGs/uU/6TTLo2Nb+NkVLQBTeWWOFRQJTT339ozqLprsFZsRkbKQdTrE0RiOLAN7HTdRbyym8Q==
MIME-Version: 1.0
X-Received: by 10.202.228.78 with SMTP id b75mr6269413oih.46.1464284781527;
	Thu, 26 May 2016 10:46:21 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.157.35.230 with HTTP; Thu, 26 May 2016 10:46:21 -0700 (PDT)
In-Reply-To: <20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
Date: Thu, 26 May 2016 13:46:21 -0400
X-Google-Sender-Auth: friNJjqfQeje139eST4r22TWrNE
Message-ID: <CAOd_LFwLw9QMk4YdpbE2aD5k3CwiWQfcqhczdFM4=iBGhFQ98A@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 17:46:25 -0000
Content-Type: text/plain; charset=UTF-8

Done, thanks!

https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a02341562a9bf254b3dd9dc71704

Cliff


On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com> wrote:
>
> meta-java repo was moved to:
> git://git.yoctoproject.org/meta-java
>
> Is it possible to update the list with that info?
>

> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

