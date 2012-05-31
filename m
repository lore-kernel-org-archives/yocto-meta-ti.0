Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8ABEE0030B
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2012 08:08:07 -0700 (PDT)
Received: from [192.168.0.53] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id C9C29608BD
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2012 16:07:11 +0100 (BST)
Message-ID: <4FC78984.2060205@communistcode.co.uk>
Date: Thu, 31 May 2012 16:08:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4FC788C8.9020405@communistcode.co.uk>
In-Reply-To: <4FC788C8.9020405@communistcode.co.uk>
Subject: Re: Beaglebone + Perf Timechart
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
X-List-Received-Date: Thu, 31 May 2012 15:08:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/12 16:05, Jack Mitchell wrote:
> Has anybody had a go at getting perf timechart up and running, perf 
> report and friends work fine but perf timechart just gives me an 
> unknown usage option. I assume I may need some extra kernel config 
> options selected, I'm using the beaglebone kernel.
>
> Regards,
>

I've debugged a bit further and this is the error:

     invalid or unsupported event: 'power:cpu_frequency'

I assume this is the signal that is not enabled in the kernel, does the 
beaglebone have support for this signal?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


