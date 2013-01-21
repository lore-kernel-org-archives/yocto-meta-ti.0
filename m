Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51F02E01458
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 02:39:03 -0800 (PST)
Message-ID: <50FD1AC4.1050506@communistcode.co.uk>
Date: Mon, 21 Jan 2013 10:39:00 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: New KERNEL_CCSUFFIX
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 10:39:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Morning all,

With Khems recent 'kernel.bbclass, module-base.bbclass: Use CC to form 
KERNEL_CC' patch, it seems the kernel compile in meta-ti is now knackered.

I get the error message:

ERROR: Nothing PROVIDES 
'virtual/arm-oecore-linux-gnueabi-gcc${KERNEL_CCSUFFIX}'

Which I guess is related to line 120 in multi-kernel.inc - I have tried 
to understand what the changes that Khem made are but it goes a bit 
above my comprehension level unfortunately. So I was wondering if anyone 
has a patch or any suggestions on how to get this going again?

Best Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


