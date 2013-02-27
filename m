Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 41478E00550
	for <meta-ti@yoctoproject.org>; Wed, 27 Feb 2013 01:40:44 -0800 (PST)
Message-ID: <512DD497.5030304@communistcode.co.uk>
Date: Wed, 27 Feb 2013 09:40:39 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Server problems....
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
X-List-Received-Date: Wed, 27 Feb 2013 09:40:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Are the TI hamsters picketing again? This morning I'm getting a lot of:

ERROR: ExpansionError during parsing 
/mnt/SSD/oe-r0005/meta-ti/recipes-bsp/boot-monitor/boot-monitor_git.bb: 
Failure expanding variable SRCPV, expression was 
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: 
Fetcher failure: Fetch command failed with exit code 128, output:
fatal: read error: Connection reset by peer

Across multiple recipes.

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


