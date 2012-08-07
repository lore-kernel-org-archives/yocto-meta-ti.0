Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C39EE002A6
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 02:01:33 -0700 (PDT)
Received: from localhost ([127.0.0.1]:58144 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SyffP-0002Wi-Aq
	for meta-ti@yoctoproject.org; Tue, 07 Aug 2012 09:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=Q7Tz5xrRe8/zB1+rLC+OaX
	8F6rQ=; b=YmyIxLUcapB0D9ZdXp2hOQJghOHcpG+QstTX1i6sowDQMkGUFGp76n
	xJsS1H7xTY3e3E4FOWiy5Sib/lQO3IcqKg/Nl+cQhoDAyD4DRsf5lETKha5s26PH
	7/z2WAcIQh3zZL1TUYJ+NPDKrPMM/SsVMKj0cq6yulIMNjxmuB3cA=
Received: from [195.171.99.130] (port=61742 helo=[192.168.0.52])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SyffP-0002Wf-8j
	for meta-ti@yoctoproject.org; Tue, 07 Aug 2012 09:01:31 +0000
Message-ID: <5020D9A0.30000@communistcode.co.uk>
Date: Tue, 07 Aug 2012 10:02:24 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Turning off kernel config option
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 09:01:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from 
meta-ti. I am using the poky distro configuration and I have changed the 
defconfig in 
meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig 
but it still builds with CONFIG_SPI_DEBUG enabled.

Do the meta-ti kernels support BSP config fragments like the yocto 
kernels or is there a better way to do this?

Regards.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


