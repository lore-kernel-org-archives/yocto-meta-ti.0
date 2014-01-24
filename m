Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C0F3E00280
	for <meta-ti@yoctoproject.org>; Fri, 24 Jan 2014 14:40:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OMeWI6023514;
	Fri, 24 Jan 2014 16:40:33 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OMeWE7017391;
	Fri, 24 Jan 2014 16:40:32 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 16:40:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OMeWNF005012;
	Fri, 24 Jan 2014 16:40:32 -0600
Date: Fri, 24 Jan 2014 17:40:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ashok Palaniswamy <Ashok.Palaniswamy@lntinfotech.com>
Message-ID: <20140124224031.GY30525@edge>
References: <127A5335E8FA314589D708E59E33891D2F5AD5D043@CHNINMSMBX01.chennaiodc.lntinfotech.com>
MIME-Version: 1.0
In-Reply-To: <127A5335E8FA314589D708E59E33891D2F5AD5D043@CHNINMSMBX01.chennaiodc.lntinfotech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: How to build Yocto project for AM3517EVM
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
X-List-Received-Date: Fri, 24 Jan 2014 22:40:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 13, 2014 at 10:48:48AM +0530, Ashok Palaniswamy wrote:
> Hi All.
> 
> I am working for AM3517 based custom board. We are planning to use yocto for 
> our development. Please let me know how to build yocto for AM3517evm board.
> 
> Is there any wiki or steps by step to build yocto project for AM3517evm ?

http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

You can build for am3517-evm machine from meta-ti.

-- 
Denys

