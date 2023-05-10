{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_tests (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/dawkaka/projects/haskell-mooc/exercises/.stack-work/install/x86_64-linux/52d8be9eefcd23ef4f81ff6315bb9298db7ec3ed8b08fae62dad9a9caaa1151b/8.10.7/bin"
libdir     = "/home/dawkaka/projects/haskell-mooc/exercises/.stack-work/install/x86_64-linux/52d8be9eefcd23ef4f81ff6315bb9298db7ec3ed8b08fae62dad9a9caaa1151b/8.10.7/lib/x86_64-linux-ghc-8.10.7/tests-0.0.1-IA10ngOIb8D3RvTcZKMLJB"
dynlibdir  = "/home/dawkaka/projects/haskell-mooc/exercises/.stack-work/install/x86_64-linux/52d8be9eefcd23ef4f81ff6315bb9298db7ec3ed8b08fae62dad9a9caaa1151b/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/dawkaka/projects/haskell-mooc/exercises/.stack-work/install/x86_64-linux/52d8be9eefcd23ef4f81ff6315bb9298db7ec3ed8b08fae62dad9a9caaa1151b/8.10.7/share/x86_64-linux-ghc-8.10.7/tests-0.0.1"
libexecdir = "/home/dawkaka/projects/haskell-mooc/exercises/.stack-work/install/x86_64-linux/52d8be9eefcd23ef4f81ff6315bb9298db7ec3ed8b08fae62dad9a9caaa1151b/8.10.7/libexec/x86_64-linux-ghc-8.10.7/tests-0.0.1"
sysconfdir = "/home/dawkaka/projects/haskell-mooc/exercises/.stack-work/install/x86_64-linux/52d8be9eefcd23ef4f81ff6315bb9298db7ec3ed8b08fae62dad9a9caaa1151b/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tests_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tests_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tests_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tests_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tests_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
