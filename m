Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
 by mx.groups.io with SMTP id smtpd.web12.274.1575289233601634336
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 04:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lucaceresoli.net, ip: 89.40.174.40, mailfrom: luca@lucaceresoli.net)
Received: from [109.168.11.45] (port=53108 helo=[192.168.101.73])
	by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1ibkgp-0039pv-1y; Mon, 02 Dec 2019 13:20:31 +0100
Subject: Re: [meta-ti] [PATCH] meta-ti: Set the --jobs based on host cpu_count
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, "Kemal R. Shakir" <kemal@ti.com>
References: <20191129144818.14061-1-luca@lucaceresoli.net>
 <CAMKF1sp-vHHK4Y=UepxZhJFcvukndix7KYoKtG3C4cDE_X9M9Q@mail.gmail.com>
From: "Luca Ceresoli" <luca@lucaceresoli.net>
Message-ID: <afdd88a1-949e-ad0a-98bb-db6b5bef66a5@lucaceresoli.net>
Date: Mon, 2 Dec 2019 13:20:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp-vHHK4Y=UepxZhJFcvukndix7KYoKtG3C4cDE_X9M9Q@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

On 29/11/19 17:17, Khem Raj wrote:
> On Fri, Nov 29, 2019 at 6:48 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>
>> From: "Kemal R. Shakir" <kemal@ti.com>
>>
>> Using BB_NUMBER_THREADS to set variables causes an "basehash value changed"
>> error when BB_NUMBER_THREADS is changed between successive builds.
>>
>> Fixes:
>>
>>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_configure, the basehash value changed from 63897a188012cedde03f756b5dbbfa70 to 13b80bf4f4327c367bd201eb4aa32ad7. The metadata is not deterministic and this needs to be fixed.
>>   ERROR: When reparsing .../meta-ti/recipes-ti/ipc/ti-ipc-rtos_git.bb.do_compile, the basehash value changed from 2fb59a7db2a2f69d2c25c06c1b6a4245 to 314c664cc040afae2800fcc378dd9ae0. The metadata is not deterministic and this needs to be fixed.
>>
>> Steps to reproduce:
>>
>>   BB_NUMBER_THREADS="3" bitbake ti-ipc-rtos
>>   BB_NUMBER_THREADS="4" bitbake -c cleansstate osal-rtos
>>   BB_NUMBER_THREADS="5" bitbake ti-ipc-rtos
>>
>> Reported here: https://e2e.ti.com/support/processors/f/791/p/825142/3059419
>> Patch from Kemal R. Shakir
>> Reported-by: Matthew McKee (e-mail unknown)
>> [Luca: add detailed commit message]
>> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>>
>> I'm having the same problem and found this patch solving it on e2e.ti.com,
>> but it does not appear on any git branch nor in the meta-ti mailing list. I
>> tested it on the thud branch and fixes the problem. Can it be applied to
>> both thud and future branches?
>>
>> Thanks
>> ---
>>  classes/ti-pdk.bbclass         | 2 +-
>>  recipes-ti/ipc/ti-ipc-rtos.inc | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
>> index f0e6f2d2738a..5f78bafa94b5 100644
>> --- a/classes/ti-pdk.bbclass
>> +++ b/classes/ti-pdk.bbclass
>> @@ -68,7 +68,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
>>
>>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
>>
>> -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
>> +PARALLEL_XDC = "--jobs=${@oe.utils.cpu_count()}"
> 
> this may create another variableto control when limting parallelism so
> expressing it in
> terms of BB_NUMBER_THREAD s desired
> 
> perhaps you can try adding
> 
> do_configure[vardepsexclude] = "PARALLEL_XDC"
> do_compile[vardepsexclude] = "PARALLEL_XDC"

Thank you for your review.

I agree the solution in this patch is not ideal as it removes ability to
control the build load.

However using BB_NUMBER_THREADS (with our without vardepsexclude) is
also not quite correct. PARALLEL_XDC should have to do with
PARALLEL_MAKE, not BB_NUMBER_THREADS.

But PARALLEL_MAKE is not a number, so using PARALLEL_MAKE would be
correct but it's not doable, and using BB_NUMBER_THREADS is doable but
not quite correct... :(

Bottom line: for lack of better ideas, I'm sending a new patch that
keeps using BB_NUMBER_THREADS and takes your suggestion above. I guess
it should be OK for most users. At least it's not worse than the current
behavior and can still be improved later.

-- 
Luca
