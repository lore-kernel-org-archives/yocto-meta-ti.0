Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E59B5E0030A; Fri, 11 Jul 2014 09:24:20 -0700 (PDT)
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
	*      [209.85.217.173 listed in list.dnswl.org]
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BD87E002AC
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 09:24:16 -0700 (PDT)
Received: by mail-lb0-f173.google.com with SMTP id v6so831348lbi.32
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EMSwKnZZGgLTVayuDXcy1LcPn5FP1ZEGRqH9cLe3Ak0=;
	b=PjUTGKVb6HyNQ+Ac6O9XMexjQnMb7QndgUhbUEQxIpSlBAzEw6006oYjecspFjCut3
	dmpfMsv7mlD7qlL8F//1Pa4Q6g/RRUtMIxKJQ0TgDccxDTXZYGd/w9/IyQtQ2MgBDBNR
	m18utbcKlQoSNvue+EenqYFOv9rTKC0rQA3R53PTXZoKfVN8VeldQgJCQ7pfiApJka5a
	jAMTlJXRQXOYcwSmP6T364nRj2Zt/BzhzI5xaaakI3i9uC0aYvfthMi4L5lNvd8ftq0W
	46aSsJBfHDK0G75REJ3HuFTcks5dy9SsVyppi+ZkAKPz9E9iOWZJvSD6MCOXFGSecAQ+
	dtsg==
MIME-Version: 1.0
X-Received: by 10.112.182.36 with SMTP id eb4mr2396995lbc.99.1405095855567;
	Fri, 11 Jul 2014 09:24:15 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.152.171.102 with HTTP; Fri, 11 Jul 2014 09:24:15 -0700 (PDT)
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE73207AE8F@DLEE08.ent.ti.com>
References: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE73207ADE2@DLEE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE73207AE8F@DLEE08.ent.ti.com>
Date: Fri, 11 Jul 2014 12:24:15 -0400
X-Google-Sender-Auth: WoHoI4I4IMmNliYWRteK1H6NniY
Message-ID: <CAOd_LFysd8sM+-PU54eEDSNCs=A2tr83yMoZMvpQ-CsutwJCTg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [diasy] omap2plus_defconfig does not include systemd support
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
X-List-Received-Date: Fri, 11 Jul 2014 16:24:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 11, 2014 at 12:08 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> Unless you also have meta-yocto-bsp layer (before daisy) defining
> beagleboard machine...

or unless you have meta-gumstix-community included ...

DEBUG: LOAD /scratch/oe/oe-build-daisy/sources/meta-ti/conf/machine/beagleboard.conf
DEBUG: CONF /scratch/oe/oe-build-daisy/sources/meta-ti/conf/machine/beagleboard.conf:5:
including conf/machine/include/omap3.inc
DEBUG: BB /scratch/oe/oe-build-daisy/sources/meta-gumstix-community/conf/machine/include/omap3.inc:
handle(data, include)
DEBUG: LOAD /scratch/oe/oe-build-daisy/sources/meta-gumstix-community/conf/machine/include/omap3.inc

Supporting multiple machines in one build present some interesting
challenges -- what are the best practices in situations like this?

I guess the good news is I got to try 3.14 on the bb ...

Cliff

