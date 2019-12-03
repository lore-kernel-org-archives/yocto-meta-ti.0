Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
 by mx.groups.io with SMTP id smtpd.web09.4585.1575374117935165371
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Dec 2019 03:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lucaceresoli.net, ip: 89.40.174.40, mailfrom: luca@lucaceresoli.net)
Received: from [109.168.11.45] (port=56492 helo=[192.168.101.73])
	by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1ic6lv-0033zp-8L; Tue, 03 Dec 2019 12:55:15 +0100
Subject: Re: [meta-ti] [PATCH] meta-ti: Set the --jobs based on host cpu_count
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, "Kemal R. Shakir" <kemal@ti.com>
References: <20191129144818.14061-1-luca@lucaceresoli.net>
 <CAMKF1sp-vHHK4Y=UepxZhJFcvukndix7KYoKtG3C4cDE_X9M9Q@mail.gmail.com>
 <afdd88a1-949e-ad0a-98bb-db6b5bef66a5@lucaceresoli.net>
 <CAMKF1sry3S0JLQLb+rc4N4FHtPCnXvA469tNA1Fj4JoPUKm5og@mail.gmail.com>
From: "Luca Ceresoli" <luca@lucaceresoli.net>
Message-ID: <a5a67694-4785-2e13-1ec6-281fac45780d@lucaceresoli.net>
Date: Tue, 3 Dec 2019 12:55:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sry3S0JLQLb+rc4N4FHtPCnXvA469tNA1Fj4JoPUKm5og@mail.gmail.com>
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

On 02/12/19 18:09, Khem Raj wrote:
[...]
>>>> --- a/classes/ti-pdk.bbclass
>>>> +++ b/classes/ti-pdk.bbclass
>>>> @@ -68,7 +68,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
>>>>
>>>>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
>>>>
>>>> -PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
>>>> +PARALLEL_XDC = "--jobs=${@oe.utils.cpu_count()}"
>>>
>>> this may create another variableto control when limting parallelism so
>>> expressing it in
>>> terms of BB_NUMBER_THREAD s desired
>>>
>>> perhaps you can try adding
>>>
>>> do_configure[vardepsexclude] = "PARALLEL_XDC"
>>> do_compile[vardepsexclude] = "PARALLEL_XDC"
>>
>> Thank you for your review.
>>
>> I agree the solution in this patch is not ideal as it removes ability to
>> control the build load.
>>
>> However using BB_NUMBER_THREADS (with our without vardepsexclude) is
>> also not quite correct. PARALLEL_XDC should have to do with
>> PARALLEL_MAKE, not BB_NUMBER_THREADS.
>>
>> But PARALLEL_MAKE is not a number, so using PARALLEL_MAKE would be
>> correct but it's not doable, and using BB_NUMBER_THREADS is doable but
>> not quite correct... :(
>>
>> Bottom line: for lack of better ideas, I'm sending a new patch that
>> keeps using BB_NUMBER_THREADS and takes your suggestion above. I guess
>> it should be OK for most users. At least it's not worse than the current
>> behavior and can still be improved later.
>>
> 
> another option would be to use parallel_make_argument to contruct what you want
> e.g. see how boost does it
> 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/boost/boost.inc#n141

Oh, good idea, thanks! It looks like the correct solution to use the
proper variable (PARALLEL_MAKE) in place of BB_NUMBER_THREADS.

But surprisingly it also fixes the "basehash value changed" problem. How
can this happen? My patch is simply:

--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
-PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"

and

--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
+PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
     XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
     BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
     ${IPC_TARGETS} \
-    JOBS="--jobs=${BB_NUMBER_THREADS}" \
+    ${PARALLEL_XDC} \
     JAVA_TOOL_OPTIONS=-Xss2560k \
 "

So I wonder why the signature is not considered as changing since
EXTRA_OEMAKE *is* changing from one build to another with a different
PARALLEL_MAKE.

Any hints?

Whatever the reason, this version definitely supersedes v2, and after
some more testing I'll send v3 with the above implementation.

-- 
Luca
