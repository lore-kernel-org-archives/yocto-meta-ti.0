Return-Path: <liljegren.mats2@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27AA3E00310
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 00:52:40 -0700 (PDT)
Received: by mail-ee0-f43.google.com with SMTP id b47so1596072eek.2
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=GMvePxrqbNuCHuUzeH/dQSj8nYyFBBuVXz3ctoUGYWk=;
	b=rGD2S8VW9qGngiQYPDsI5Qs/kRHr9Lu5NVhjUUISL/bRKekf0KBR1qMtm6rQIMRgHa
	1B8nSeg9BinUfqwm2eJroqPBCTkmwPx2dt4q98/Oq7fzbmv7DE4CKDLs4Ndri6N2JApW
	q3pnaPRkIH3kNkaOqE5iOy9T8GBWdEJGrN7dJi38RqClrIlz0qaQB81oAgWypQUj/dZm
	jyBS7V3RhdINM73KbCka85e052SBumxXDUba6l1Rl9Eb9DFePpnk7Y6F5iAvz5+wAFHu
	zg4qmJP9RewyC3K8Lm/1WKzWSinI+Mv2J6k4l00hyVja5WGI1gh0i1du7bvfJ3e7dCM4
	bu0g==
MIME-Version: 1.0
X-Received: by 10.14.202.201 with SMTP id d49mr1661925eeo.1.1367221959834;
	Mon, 29 Apr 2013 00:52:39 -0700 (PDT)
Received: by 10.15.24.72 with HTTP; Mon, 29 Apr 2013 00:52:39 -0700 (PDT)
In-Reply-To: <517AA0FE.4080005@ti.com>
References: <CA+xJJ18wBM7G=Nt12yMX8KLmTZWS+SnBsXb3F4X1xgq=Y=0y0w@mail.gmail.com>
	<517AA0FE.4080005@ti.com>
Date: Mon, 29 Apr 2013 09:52:39 +0200
Message-ID: <CA+xJJ1-bns9yGh1=zgTXn7cNivx9oL4evqN=9HN73kuq_-D3mw@mail.gmail.com>
From: Mats Liljegren <liljegren.mats2@gmail.com>
To: William Mills <wmills@ti.com>
Cc: meta-ti <meta-ti@yoctoproject.org>, linux-omap <linux-omap@vger.kernel.org>
Subject: Re: Full nohz on TCI6638k2k (KeyStone II)
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
X-List-Received-Date: Mon, 29 Apr 2013 07:52:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 26, 2013 at 5:45 PM, William Mills <wmills@ti.com> wrote:
> On 04/26/2013 03:06 AM, Mats Liljegren wrote:
>>
>> I would like to perform a customer demo running a benchmark
>> application in full nohz mode on TCI6638k2k target, which as far as I
>> understand it is a KeyStone II architecture.
>>
>> Does anyone know what the best Linux source code is to perform the
>> nohz port for this board? It should preferably be Linux 3.9 of any RC
>> level, but 3.8 should work as well.
>>
>> I also need a hardware timer to be used as an interrupt source for the
>> interrupt latency measurements. Any suggestions for framework or
>> driver to use?
>>
>
> Mats,
>
> The team is just now rebasing the bringup work on 3.8.4.  You can find their
> work here:
> http://arago-project.org/git/projects/?p=linux-keystone.git;a=shortlog;h=refs/heads/release-server/master
>
> (The word "server" ~= 3.8 for this archive)
>
> Please note that all the master branches are rebuilt from the feature
> branches in the nightly build script.  I think the feature branches get
> rebased also.  The tags of course you can count on.
>
> The A15's use the per-core archetecture timer normally.  However the SOC has
> multiple (20) Timer64 peripherals that can be used as well if they are not
> being used by the DSPs.  If you configure which timer64 to use w/ device
> tree you should be fine.
>
> Bill

Thanks! I'll check it out.

/Mats

