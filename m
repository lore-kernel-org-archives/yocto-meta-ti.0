Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C32F0E00A08; Fri, 10 Mar 2017 18:00:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.66 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.66 listed in list.dnswl.org]
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A9E6E009B9
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 18:00:22 -0800 (PST)
Received: by mail-pg0-f66.google.com with SMTP id 25so11976981pgy.3
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 18:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UuuESXWcm55uepKvbSnmDy9yptMu6hMrjDWTXVapthU=;
	b=DZvBvfhK25PqbXmmUJq1acsPwU1sv6FUiG7m3ivDci0Rm9BkuDovJatnmQsZJqaYas
	mCw5wXka/uCKlm+63mwN7GzW1X1RJJOFPdIbvYQCJNqQPz/3bPq8h6JP/IpYoXhZoLU6
	LokFsBwmk3UI2UWwWMIleTQlNCB7hRTvW7nRVVRKCS66ZmonA7cOi1Y8tHl4iRK7akmN
	Dv6Up9r8szzcJjFhyhvH04AoM3tB6s5V99Sv6EEgjD9Nw/XTuU+fE7T9sgMNsMdQXYOt
	HpQaSLHRwW7LAeP2Zq1XfhnZn44iJxLl9Vi86Xe7WlrWzlDyQxftFZBw3cZ3nMjKdB6B
	ShgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UuuESXWcm55uepKvbSnmDy9yptMu6hMrjDWTXVapthU=;
	b=sIIQ8E/p20iV1pV2yMEyZbWBfDj3R49mZHJkfKgRepENv2ZkEQz5kdGe2HVZ26Oli1
	6lA/QK4/0nJFZaYJtXHDWJnrFKinNwNJF/47RK4gl8YHQ9FbHbnXCpN7OWdT4NqJv/PI
	oAZMAjicam1FN2Zd9NQAJ8sKc2YqfaDivsxzDLthrkOh7oIeAUcQqBcFW4dRSFl1SBlj
	YDDZinTEcicmPzuzpGA5QmW/cPeGhEYLwEyXrEaLop+gXVE5qzeGrIiQlATgPIue6BxI
	Xbz38Sr5kUQN7/hC12/DKbc6f7OCNXtBb1FmExFmmG497gOYm47IF9NldJ5JZ+Z/fbsP
	Vg6A==
X-Gm-Message-State: AMke39l1yG1KXLJTgILmu2G/5003Ql1kUYJSflaf9WFRgb6Ob8wvQJaPKOEP/g5u/O3+HQ==
X-Received: by 10.99.152.10 with SMTP id q10mr23715206pgd.192.1489197621885;
	Fri, 10 Mar 2017 18:00:21 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d16a:f79a:feb6:e660])
	by smtp.gmail.com with ESMTPSA id
	c22sm20989106pgn.43.2017.03.10.18.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 18:00:21 -0800 (PST)
To: Denys Dmytriyenko <denys@ti.com>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
	<20170308170328.GA2586@haswell> <20170311014705.GY578@edge>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8777103b-9a6f-c1fb-f5ad-f04dc7f44401@gmail.com>
Date: Fri, 10 Mar 2017 18:00:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170311014705.GY578@edge>
Cc: meta-ti@yoctoproject.org, Gary Thomas <gary@mlbassoc.com>
Subject: Re: Getting TI tools into [host] SDK
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
X-List-Received-Date: Sat, 11 Mar 2017 02:00:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/10/17 5:47 PM, Denys Dmytriyenko wrote:
> On Wed, Mar 08, 2017 at 09:03:28AM -0800, Khem Raj wrote:
>> On 17-03-08 09:10:18, Gary Thomas wrote:
>>> I'm trying to build a [host] SDK for my target which uses some
>>> TI tools, via -c populate_sdk_ext
> 
> Gary,
> 
> We don't use -c populate_sdk to produce SDKs. Instead, we still rely on the 
> old meta-toolchain mechanism. First, because it can be incorporated into other 
> recipes - i.e. we have a recipe that combines rootfs and SDK into one tarball. 
> Second, it provides more control to what get's packaged into SDK. Third, it 
> doesn't have this undefined magic to packaging stuff - i.e. this post is an 
> example of it failing. And only one slight drawback - requires keeping rootfs 
> image recipe in sync with meta-toolchain SDK recipe...
> 
> 
>>> In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
>>> I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
>>> I include ti-cgt-pru in my target image to get the tools on my board - that also works.
>>>
>>> The problem is that in my SDK, none of the binaries are included, including clpru:
>>>
>>> $ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
>>> total 16
>>> drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
>>> drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
>>>
>>> I added this to try and include the files:
>>>   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
>>> and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
>>> executables included, they just aren't being packaged.
>>>
>>> $ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
>>
>> perhaps you need to correct the install location for nativesdk may be
>> via overriding do_install
> 
> Why?
> 

because  /usr/share doesnt look normal place for putting executables.

